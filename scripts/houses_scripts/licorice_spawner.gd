extends Node2D
@onready var main = self.get_parent()

var licorice_baddie_scene = preload("res://scenes/licorice_baddie.tscn")

@onready var player = $"../Player"

#func _physics_process(delta: float) -> void:
	#print($Timer.time_left)

func _on_timer_timeout():
	var licorice_baddie = licorice_baddie_scene.instantiate()
	
	licorice_baddie.position = player.position - Vector2(200, 200)
	
	main.add_child(licorice_baddie)
