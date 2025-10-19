extends Node

var hands = 0
var compChoice = 0

func _ready():
	compChoice = randi_range(0, 2)
	print(compChoice)
	

func play():
	if hands == 0 and compChoice == 0:
		tryAgain()
	elif hands == 0 and compChoice == 1:
		lost()
		JawBreakerCounter.JBCounter -= 1
	elif hands == 0 and compChoice == 2:
		won()
		JawBreakerCounter.JBCounter += 1
	elif hands == 1 and compChoice == 0:
		won()
		FruitRollUpCounter.FRUCount += 1
	elif hands == 1 and compChoice == 1:
		tryAgain()
	elif hands == 1 and compChoice == 2:
		lost()
		FruitRollUpCounter.FRUCount -= 1
	elif hands == 2 and compChoice == 0:
		lost()
		ScissorsCounter.SCounter -= 1
	elif hands == 2 and compChoice == 1:
		won()
		ScissorsCounter.SCounter += 1
	elif hands == 2 and compChoice == 2:
		tryAgain()
		
func tryAgain():
	print("Try Again")
	compChoice = randi_range(0, 2)
	print(compChoice)
	
func won():
	print("Winner")
	
func lost():
	print("Loser")
	
