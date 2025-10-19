extends CharacterBody2D

@onready var player = get_node("/root/Trick-Or-Treating/Player")

const speed = 150


func _physics_process(_delta):
	if player != null:
		var direction = player.position - position
		
		direction = direction.normalized()
		
		velocity = direction * speed

		move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.die()
		print("hitting player")
