extends Node2D

func _on_franenstein_texture_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/frankenstein_mask.tscn")

func _on_vampire_texture_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/vampire_mask.tscn")

func _on_warewolf_texture_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/warewolf_mask.tscn")
