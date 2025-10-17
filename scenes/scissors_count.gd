extends Label

func _process(delta):
	self.text = str(ScissorsCounter.SCounter)
	if ScissorsCounter.SCounter == 0:
		$"../Scissors".disabled = true

func _on_scissors_pressed() -> void:
	ScissorsCounter.SCounter -= 1
	PlayRps.hands = 2
	PlayRps.play()
