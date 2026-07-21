extends Control

@export var pause_ui: Control
var settings: Control
var level_select: Control
var gameNode: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settings = load("res://scenes/settings_ui.tscn").instantiate()
	level_select = load("res://scenes/level_select_ui.tscn").instantiate()
	gameNode = get_tree().root.get_node("/root/Game")

#Unpause game
func _on_resume_pressed() -> void:
	get_tree().paused = false
	get_parent().remove_child(pause_ui)
	print("resume")

func _on_settings_pressed() -> void:
	add_child(settings)
	print("open settings")

#Unpause game as well
func _on_quit_pressed() -> void:
	get_tree().paused = false
	gameNode.add_child(level_select)
	get_parent().get_parent().queue_free()
	print("quit game")
