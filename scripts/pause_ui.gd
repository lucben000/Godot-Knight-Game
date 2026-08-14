extends Control

@onready var pause_ui: Control = $"."
@onready var sfx: AudioStreamPlayer = $SFX
var settings: Control
var level_select: Control
var gameNode: Node2D
var fade: CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settings = load("res://scenes/settings_ui.tscn").instantiate()
	level_select = load("res://scenes/level_select_ui.tscn").instantiate()
	fade = load("res://scenes/fade.tscn").instantiate()
	gameNode = get_tree().root.get_node("/root/Game")

#Unpause game
func _on_resume_pressed() -> void:
	sfx.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().paused = false
	get_parent().remove_child(pause_ui)
	print("resume")

func _on_settings_pressed() -> void:
	sfx.play()
	add_child(settings)
	print("open settings")

#Unpause game as well
func _on_quit_pressed() -> void:
	sfx.play()
	get_tree().root.add_child(fade)
	await get_tree().create_timer(1.0).timeout
	gameNode.add_child(level_select)
	get_tree().paused = false
	get_parent().get_parent().queue_free()
	print("quit game")
