extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
var coins: int
@export var doorPassable: bool

func _ready() -> void:
	doorPassable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	coins = get_parent().find_child('Coins').get_child_count()
	if coins <= 0:
		doorPassable = true
		levelWin()

func levelWin():
	var texture = load("res://assets/myAssets/doorUnlocked.png")
	sprite_2d.texture = texture
