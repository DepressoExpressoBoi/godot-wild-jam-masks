class_name GameController extends Node

@export var trick_or_treating : Node2D
var rps 

func _ready() -> void:
	Global.game_controller = self

var current_tot_scene
var current_rps_scene

func change_to_rps():
	trick_or_treating.get_node("Player").position.y = trick_or_treating.get_node("Player").position.y + 50
	Global.game_controller.remove_child(trick_or_treating)
	var rps = preload("res://scenes/RPSScenes/RockPaperScissors.tscn").instantiate()
	Global.game_controller.add_child(rps)
	
func change_to_tot():
	if rps is Node:
		rps.queue_free()
	Global.game_controller.add_child(trick_or_treating)
	
	
	

func change_tot_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_tot_scene != null:
		if delete:
			current_tot_scene.queue_free()
		elif keep_running:
			current_tot_scene.visible = false
		else:
			Global.game_controller.remove_child(current_tot_scene)
			
	var new = load(new_scene).instantiate()
	Global.game_controller.add_child(new)
	current_tot_scene = new
	
	
