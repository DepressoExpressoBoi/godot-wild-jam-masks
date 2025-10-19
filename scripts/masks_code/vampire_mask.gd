extends Node2D


func _on_back_vampire_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/masks_background/mask_demo.tscn")


func _on_next_button_pressed() -> void:
	print("Start pressed")
	
	#fill in here too
	
	#get_tree().change_scene_to_file("res://scenes/mask_demo.tscn")
