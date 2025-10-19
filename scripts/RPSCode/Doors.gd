extends Panel
#func _init() -> void:
	#retry()
	
func _ready():
	retry()
	print(get_tree())

func closeDoor():
	$"3Hands".visible = false
	$Closed.visible = true
	await get_tree().create_timer(1).timeout
	$Closed.visible = false
	
func compChoiceDoor():
	if PlayRps.compChoice == 0:
		$Rock.visible = true
	if PlayRps.compChoice == 1:
		$Paper.visible = true
	if PlayRps.compChoice == 2:
		$Scissors2.visible = true 

func retry():
	$Closed.visible = true
	await get_tree().create_timer(1).timeout
	$Closed.visible = false
	$Open.visible = true
	await get_tree().create_timer(1).timeout
	$Open.visible = false
	$"3Hands".visible = true

func compChoiceDoorClose():
	if PlayRps.compChoice == 0:
		$Rock.visible = false
	if PlayRps.compChoice == 1:
		$Paper.visible = false
	if PlayRps.compChoice == 2:
		$Scissors2.visible = false
