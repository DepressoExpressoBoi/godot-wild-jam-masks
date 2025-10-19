extends Node2D


func _on_back_fran_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/mask_demo.tscn")

func _on_jack_sticker_button_pressed() -> void:
	var movement_vector = Vector2(100, 50)
	self.rect_position += movement_vector

func _on_skull_sticker_button_pressed() -> void:
	pass # Replace with function body.

func _on_cat_sticker_button_pressed() -> void:
	pass # Replace with function body.

func _on_spider_sticker_button_pressed() -> void:
	pass # Replace with function body.

func _on_cauldron_button_pressed() -> void:
	pass # Replace with function body.
