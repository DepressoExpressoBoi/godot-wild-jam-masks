extends Label

func _process(delta):
	self.text = str(ScissorsCounter.SCounter)

func _on_scissors_pressed() -> void:
	ScissorsCounter.SCounter -= 1
