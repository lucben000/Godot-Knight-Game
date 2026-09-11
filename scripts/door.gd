extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var doorPassable: bool

enum winConditions { COIN, ENEMY, NONE }
@export var winCondition : winConditions
enum transitions { LEVEL_SELECT, CREDITS }
@export var levelEnding : transitions

var gameNode: Node2D
var level: Node

var coins: int
var hiddenCoins: int
var enemies: int

func _ready() -> void:
	doorPassable = false
	gameNode = get_tree().root.get_node("/root/Game")
	level = gameNode.get_child(1)
	hiddenCoins = level.find_child('Hidden Coins').get_child_count()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if winCondition == winConditions.COIN:
		coins = level.find_child('Coins').get_child_count() + hiddenCoins
		if coins <= 0:
			doorPassable = true
			levelWin()
	elif winCondition == winConditions.ENEMY:
		enemies = get_parent().find_child('Enemies').get_child_count()
		if enemies <= 0:
			doorPassable = true
			levelWin()
	else:
		doorPassable = true
		levelWin()

func levelWin():
	var texture = load("res://assets/myAssets/doorUnlocked.png")
	sprite_2d.texture = texture
	
	if Global.level == Global.levels.TUTORIAL_LEVEL:
		SaveSystem.profile["level_1"] = true
	if Global.level == Global.levels.LEVEL_1:
		SaveSystem.profile["level_2"] = true
	if Global.level == Global.levels.LEVEL_2:
		SaveSystem.profile["level_3"] = true
	if Global.level == Global.levels.LEVEL_3:
		SaveSystem.profile["level_4"] = true
	if Global.level == Global.levels.LEVEL_4:
		SaveSystem.profile["level_5"] = true
