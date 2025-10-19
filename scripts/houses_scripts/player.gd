extends CharacterBody2D

#@onready var rps = preload("res://scenes/RPSScenes/RockPaperScissors.tscn").instance()

const speed = 300

func _physics_process(_delta):
	var horizontal_dir = Input.get_axis("ui_left", "ui_right")
	var vertical_dir = Input.get_axis("ui_up", "ui_down")
	
	if horizontal_dir:
		velocity.x = horizontal_dir * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if vertical_dir:
		velocity.y = vertical_dir * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()

func die():
	queue_free()

func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("houses"):
		#get_parent().add_child(rps)
		#get_parent().remove_child(self)
		get_tree().change_scene_to_file("res://scenes/RPSScenes/RockPaperScissors.tscn")
