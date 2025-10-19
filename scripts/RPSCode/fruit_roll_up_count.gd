extends Label

var doors_node 

func _ready():
	doors_node = get_node("../Doors")
	
func _process(delta):
	self.text = str(FruitRollUpCounter.FRUCount)
	if FruitRollUpCounter.FRUCount == 0:
		$"../FruitRollUp".disabled = true 

func _on_fruit_roll_up_pressed() -> void:
	PlayRps.hands = 1
	await doors_node.closeDoor()
	doors_node.compChoiceDoor()
	var result = PlayRps.play()
	
	if result == "tie": 
		await get_tree().create_timer(2).timeout 
		await doors_node.compChoiceDoorClose()
		PlayRps.tryAgain() 
		await doors_node.retry()  
