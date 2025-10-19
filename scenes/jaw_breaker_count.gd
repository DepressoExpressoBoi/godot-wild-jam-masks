extends Label

func _process(delta):
	self.text = str(JawBreakerCounter.JBCounter)
	if JawBreakerCounter.JBCounter == 0:
		$"../JawBreaker".disabled = true
	

func _on_jaw_breaker_pressed() -> void:
	PlayRps.hands = 0
	PlayRps.play()
