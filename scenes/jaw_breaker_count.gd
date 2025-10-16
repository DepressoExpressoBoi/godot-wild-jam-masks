extends Label

func _process(delta):
	self.text = str(JawBreakerCounter.JBCounter)

func _on_jaw_breaker_pressed() -> void:
	JawBreakerCounter.JBCounter -= 1
