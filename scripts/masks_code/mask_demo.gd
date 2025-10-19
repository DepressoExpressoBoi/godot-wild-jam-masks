extends Node2D

func _on_franenstein_texture_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/masks_drag/frankenstein_mask.tscn")

func _on_vampire_texture_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/masks_drag/vampire_mask.tscn")

func _on_warewolf_texture_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/masks_drag/warewolf_mask.tscn")
