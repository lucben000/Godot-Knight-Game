extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var doorPassable: bool
enum winConditions { COIN, ENEMY, NONE }
@export var winCondition : winConditions
var coins: int
var enemies: int

func _ready() -> void:
	doorPassable = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if winCondition == winConditions.COIN:
		coins = get_parent().find_child('Coins').get_child_count()
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
