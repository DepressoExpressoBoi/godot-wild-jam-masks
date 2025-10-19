extends Label

var doors_node 

func _ready():
	doors_node = get_node("../Doors")

func _process(delta):
	self.text = str(ScissorsCounter.SCounter)
	if ScissorsCounter.SCounter == 0:
		$"../Scissors".disabled = true

func _on_scissors_pressed() -> void:
	PlayRps.hands = 2
	await doors_node.closeDoor()
	doors_node.compChoiceDoor()
	PlayRps.play()
