extends Label


@onready var CoinGroup: Node = $"../Coins"
var coins = 0

func _ready():
	coins = CoinGroup.get_child_count()
	
func minus_coins():
	coins -= 1
	
	if coins == 0:
		text = "Congrats you win the game"
	else:
		text = "You are missing " + str(coins) + " coins. Collect them to beat the game."
