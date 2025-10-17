extends CharacterBody2D

@onready var player = get_node("/root/Trick-Or-Treating/Player")

const speed = 150


func _physics_process(_delta):
	var direction = player.position - position
	
	direction = direction.normalized()
	
	velocity = direction * speed

	move_and_slide()
