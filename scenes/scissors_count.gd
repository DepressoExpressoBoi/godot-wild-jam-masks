extends Label

func _process(delta):
	self.text = str(ScissorsCounter.SCounter)
	if ScissorsCounter.SCounter == 0:
		$"../Scissors".disabled = true

func _on_scissors_pressed() -> void:
	PlayRps.hands = 2
	Doors.closeDoor()
	Doors.compChoiceDoor()
	PlayRps.play()
