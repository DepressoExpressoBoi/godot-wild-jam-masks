extends Label

func _process(delta):
	self.text = str(FruitRollUpCounter.FRUCount)
	if FruitRollUpCounter.FRUCount == 0:
		$"../FruitRollUp".disabled = true 

func _on_fruit_roll_up_pressed() -> void:
	PlayRps.hands = 1
	Doors.closeDoor()
	Doors.compChoiceDoor()
	PlayRps.play()
