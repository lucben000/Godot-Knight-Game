extends Label

var gameNode: Node2D
var level: Node
var CoinGroup: Node
var coins: int

var EnemyGroup: Node
var enemies: int

func _ready():
	gameNode = get_tree().root.get_node("/root/Game")
	level = gameNode.get_child(1)
	
	CoinGroup = level.find_child("Coins")
	#print(CoinGroup)
	coins = CoinGroup.get_child_count()
	#print(coins)
	
	EnemyGroup = level.find_child("Enemies")
	enemies = EnemyGroup.get_child_count()
	
func minus_coins():
	coins -= 1
	
	if coins == 0:
		text = "Congrats you beat the level"
	else:
		text = "You are missing " + str(coins) + " coins"
		

func minus_enemies():
	enemies -= 1
	
	if enemies == 0:
		text = "Congrats you beat the level"
	else:
		text = "You are missing " + str(enemies) + " enemies to kill."
		
