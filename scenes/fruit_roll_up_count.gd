extends Label

func _process(delta):
	self.text = str(FruitRollUpCounter.FRUCount)

func _on_fruit_roll_up_pressed() -> void:
	FruitRollUpCounter.FRUCount -= 1
