extends Label

var doors_node 
var won_label
var lost_label
var tie_label

#@onready var trick_or_treating = preload("res://scenes/trick_or_treating.tscn").instance()
#@export var tot:PackedScene

func _ready():
	doors_node = get_node("../Doors")
	won_label = get_node("../You Won!")
	lost_label = get_node("../You Lost!")
	tie_label = get_node("../Try Again")
	
func _process(delta):
	self.text = str(FruitRollUpCounter.FRUCount)
	if FruitRollUpCounter.FRUCount == 0:
		$"../FruitRollUp".disabled = true 

func _on_fruit_roll_up_pressed() -> void:
	PlayRps.hands = 1
	await doors_node.closeDoor()
	doors_node.compChoiceDoor()
	var result = PlayRps.play()
	
	if result == "won":
		won_label.visible = true
<<<<<<< Updated upstream
		await get_tree().create_timer(1).timeout 
		won_label.visible = false 
		await get_tree().change_scene_to_file("res://scenes/trick_or_treating.tscn")
	elif result == "lost":
		lost_label.visible = true
		await get_tree().create_timer(1).timeout 
		lost_label.visible = false
		await get_tree().change_scene_to_file("res://scenes/trick_or_treating.tscn")
=======
		get_tree().change_scene_to_file("res://scenes/trick_or_treating.tscn")
		#get_tree().change_scene_to_packed(tot)
	elif result == "lost":
		lost_label.visible = true
		get_tree().change_scene_to_file("res://scenes/trick_or_treating.tscn")
		#get_tree().change_scene_to_packed(tot)
>>>>>>> Stashed changes
	elif result == "tie":
		tie_label.visible = true 
		await get_tree().create_timer(2).timeout 
		tie_label.visible = false 
		await doors_node.compChoiceDoorClose()
		PlayRps.tryAgain() 
		await doors_node.retry()  
		return
