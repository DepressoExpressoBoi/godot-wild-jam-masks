extends Label

var doors_node 

func _ready():
	doors_node = get_node("../Doors")
	
func _process(delta):
	self.text = str(JawBreakerCounter.JBCounter)
	if JawBreakerCounter.JBCounter == 0:
		$"../JawBreaker".disabled = true
	

func _on_jaw_breaker_pressed() -> void:
	PlayRps.hands = 0
	await doors_node.closeDoor()
	doors_node.compChoiceDoor()
	PlayRps.play()
