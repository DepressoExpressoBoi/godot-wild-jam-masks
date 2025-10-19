extends CharacterBody2D

@onready var player = get_node("/root/Trick-Or-Treating/Player")

const speed = 150


func _physics_process(_delta):
	if player != null:
		var direction = player.position - position
		
		direction = direction.normalized()
		
		print(direction)
		
		if direction.x > 0.95 or direction.x < -0.95 or direction.y > 0.95 or direction.y < -0.95:
			position =  player.position - Vector2(200, 200)
		
		velocity = direction * speed

		move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.die()
		print("hitting player")
