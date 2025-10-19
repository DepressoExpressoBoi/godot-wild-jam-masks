extends TileMapLayer

const north = 1
const east = 2
const south = 4
const west = 8

var cell_walls = {Vector2i(2, 0): east, Vector2i(-2, 0): west, Vector2i(0, 2): south, Vector2i(0, -2): north}
var tile_indices = {
	Vector2i(0, 0): 0, Vector2i(1, 0): 1, Vector2i(2, 0): 2, Vector2i(3, 0): 3,
	Vector2i(0, 1): 4, Vector2i(1, 1): 5, Vector2i(2, 1): 6, Vector2i(3, 1): 7,
	Vector2i(0, 2): 8, Vector2i(1, 2): 9, Vector2i(2, 2): 10, Vector2i(3, 2): 11,
	Vector2i(0, 3): 12, Vector2i(1, 3): 13, Vector2i(2, 3): 14, Vector2i(3, 3): 15,
}
var coord_indices = {
	0: Vector2i(0, 0), 1: Vector2i(1, 0), 2: Vector2i(2, 0), 3: Vector2i(3, 0),
	4: Vector2i(0, 1), 5: Vector2i(1, 1), 6: Vector2i(2, 1), 7: Vector2i(3, 1),
	8: Vector2i(0, 2), 9: Vector2i(1, 2), 10: Vector2i(2, 2), 11: Vector2i(3, 2),
	12: Vector2i(0, 3), 13: Vector2i(1, 3), 14: Vector2i(2, 3), 15: Vector2i(3, 3),
}

var house_coords = {
	1: Vector2i(0, 0), 2: Vector2i(1, 0), 3: Vector2i(0, 1), 4: Vector2i(1, 1)
}

var width = 25
var height = 25

var erase_fraction = 0.1

@onready var map = $"."
@onready var house_map = $"../Houses"
@onready var player = $"../Player"

var initialized = 0

func _ready():
	if initialized == 0:
		initialized += 1
		randomize()
		make_maze()
		erase_walls()
		place_houses()
		var rileys_house = place_rileys_house()
		
		player.position = rileys_house

	
func place_houses():
	for x in range(width):
		for y in range(height):
			if tile_indices[map.get_cell_atlas_coords(Vector2i(x, y))] == 15:
				house_map.set_cell(Vector2i(x, y), 0, house_coords[randi_range(1, 4)])
	
				
func place_rileys_house():
	for x in range(8, width - 1):
		for y in range(8, height - 1):
			
			if house_map.get_cell_atlas_coords(Vector2i(x, y)) != Vector2i(-1, -1) and tile_indices[map.get_cell_atlas_coords(Vector2i(x, y + 1))] == 5:
				house_map.set_cell(Vector2i(x, y), 0, Vector2i(0, 2))
				
				return map.to_global(Vector2i(x, y + 1)) * Vector2(68, 64)

	return "bad"
	
			
	
func erase_walls():
	for i in range(int(width * height * erase_fraction)):
		var x = randi_range(2, width/2 - 2) * 2
		var y = randi_range(2, height/2 - 2) * 2
		var cell = Vector2i(x, y)
		var neighbor = cell_walls.keys()[randi() % cell_walls.size()]
		
		if tile_indices[map.get_cell_atlas_coords(cell)] & cell_walls[neighbor]:
			var walls = tile_indices[map.get_cell_atlas_coords(cell)] - cell_walls[neighbor]
			var n_walls = tile_indices[map.get_cell_atlas_coords(cell+neighbor)] - cell_walls[-neighbor]
			
			map.set_cell(cell, 0, coord_indices[walls])
			map.set_cell(cell + neighbor, 0, coord_indices[n_walls])
			
			if neighbor.x != 0:
				map.set_cell(cell + neighbor/2, 0, coord_indices[5])
			else:
				map.set_cell(cell + neighbor/2, 0, coord_indices[10])
			
	
func check_neighbors(cell, unvisited):
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited:
			list.append(cell + n)
	return list	
	
func make_maze():
	var unvisited = []
	var stack = []
	
	map.clear()
	for x in range(width):
		for y in range(height):
			#unvisited.append(Vector2i(x, y))
			#map.set_cell(Vector2i(x, y), 0, Vector2i(3, 3))
			map.set_cell(Vector2i(x, y), 0, coord_indices[north|east|south|west])
			
	for x in range(0, width, 2):
		for y in range(0, height, 2):
			unvisited.append(Vector2i(x, y))
	
	var current = Vector2i(0, 0)
	unvisited.erase(current)
	
	while unvisited:
		var neighbors = check_neighbors(current, unvisited)
		
		if neighbors.size() > 0:
			var next = neighbors[randi() % neighbors.size()]
			stack.append(current)
			
			var direction = next - current
			var current_walls = tile_indices[map.get_cell_atlas_coords(current)] - cell_walls[direction]
			var next_walls = tile_indices[map.get_cell_atlas_coords(next)] - cell_walls[-direction]
			map.set_cell(current, 0, coord_indices[current_walls])
			map.set_cell(next, 0, coord_indices[next_walls])
			
			if direction.x != 0:
				map.set_cell(current + direction/2, 0, coord_indices[5])
			else:
				map.set_cell(current + direction/2, 0, coord_indices[10])
			
			current = next
			unvisited.erase(current)
		elif stack:
			current = stack.pop_back()
