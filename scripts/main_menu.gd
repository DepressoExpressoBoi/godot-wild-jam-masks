extends Control

func _ready():
	pass
	
func _process(delta):
	pass

func _on_start_button_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/mask_demo.tscn")


func _on_franenstein_button_pressed() -> void:
	print("franenstein pressed")
	get_tree().change_scene_to_file("res://scenes/frankenstein_mask.tscn")


func _on_option_button_pressed() -> void:
	print("options pressed")
	get_tree().change_scene_to_file("res://scenes/option_list.tscn")

func _on_exit_button_pressed() -> void:
	print("exit pressed")
	get_tree().quit()




func _on_sound_button_pressed() -> void:
	print("sound pressed")
	get_tree().change_scene_to_file("res://scenes/mask_demo.tscn")

func _on_picture_button_pressed() -> void:
	print("picture pressed")
	get_tree().change_scene_to_file("res://scenes/option_list.tscn")

func _on_back_button_pressed() -> void:
	print("back pressed")
	get_tree().change_scene_to_file("res://scenes/mask_demo.tscn")
	
	
	
	
