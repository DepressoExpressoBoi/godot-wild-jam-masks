extends Control

func _ready():
	pass
	
func _process(delta):
	pass

func _on_start_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/masks_background/mask_demo.tscn")

func _on_option_button_pressed() -> void:
	print("options pressed")
	get_tree().change_scene_to_file("res://scenes/masks_background/option_list.tscn")

func _on_exit_button_pressed() -> void:
	print("exit pressed")
	get_tree().quit()
