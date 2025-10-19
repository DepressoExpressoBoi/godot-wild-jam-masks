extends Node2D
@onready var main = get_node("/root/Trick-Or-Treating")

var licorice_baddie_scene = preload("res://scenes/licorice_baddie.tscn")

@onready var player = $"../Player"

func _on_timer_timeout():
	var licorice_baddie = licorice_baddie_scene.instantiate()
	
	licorice_baddie.position = player.position - Vector2(200, 200)
	
	main.add_child(licorice_baddie)
