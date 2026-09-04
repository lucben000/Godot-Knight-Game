extends Area2D

@onready var timer: Timer = $Timer
var gameNode: Node2D
var levelNode: Node
var restarlevelNode: Node

func _ready() -> void:
	gameNode = get_tree().root.get_node("/root/Game")
	levelNode = gameNode.get_child(1)
	restarlevelNode = levelNode.duplicate()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "PlayerDeath":
		print("Game over. You died")
		area.get_node("CollisionShape2D").queue_free()
		Engine.time_scale = 0.5
		timer.start()

#After timer ends, restart engine speed and level
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	gameNode.add_child(restarlevelNode)
	levelNode.queue_free()
	#get_tree().reload_current_scene()
