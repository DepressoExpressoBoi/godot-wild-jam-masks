extends Node2D


func _on_sound_button_pressed() -> void:
	print("Start pressed")
	pass


func _on_picture_button_pressed() -> void:
	print("Start pressed")
	pass


func _on_back_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
