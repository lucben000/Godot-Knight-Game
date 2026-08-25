extends Node

enum levels { TUTORIAL_LEVEL, LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4, LEVEL_5}
var level : levels

func _ready() -> void:
	SaveSystem.loadGame()
