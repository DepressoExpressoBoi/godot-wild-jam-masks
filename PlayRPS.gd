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
	elif hands == 0 and compChoice == 2:
		won()
	elif hands == 1 and compChoice == 0:
		won()
	elif hands == 1 and compChoice == 1:
		tryAgain()
	elif hands == 1 and compChoice == 2:
		lost()
	elif hands == 2 and compChoice == 0:
		lost()
	elif hands == 2 and compChoice == 1:
		won()
	elif hands == 2 and compChoice == 2:
		tryAgain()
		
func tryAgain():
	print("Try Again")
	
func won():
	print("Winner")
	
func lost():
	print("Loser")
	
