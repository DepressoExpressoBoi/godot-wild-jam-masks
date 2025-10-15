extends CharacterBody2D

const speed = 300

func _physics_process(delta):
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
