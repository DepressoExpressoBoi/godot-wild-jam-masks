extends CharacterBody2D


const speed = 300

func _physics_process(delta):
	var hor_dir = Input.get_axis("ui_left", "ui_right")
	var ver_dir = Input.get_axis("ui_up", "ui_down")
	
	if hor_dir:
		velocity.x = hor_dir * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if ver_dir:
		velocity.y = ver_dir * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
