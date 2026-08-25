extends Control

@export var menu_ui: Control
var settings: Control
var levels: Control
@onready var sfx: AudioStreamPlayer = $SFX

func _ready() -> void:
	settings = preload("res://scenes/settings_ui.tscn").instantiate()
	levels = preload("res://scenes/level_select_ui.tscn").instantiate()

func _on_play_button_pressed() -> void:
	#add_child(levels)
	sfx.play()
	get_parent().add_child(levels)
	menu_ui.queue_free()
	#print("play game")

func _on_settings_button_pressed() -> void:
	#var settingsScene = preload("res://scenes/settings_ui.tscn")
	#var settings = settingsScene.instantiate()
	sfx.play()
	add_child(settings)
	#print("open settings")

func _on_quit_button_pressed() -> void:
	SaveSystem.saveGame()
	sfx.play()
	await get_tree().create_timer(0.2).timeout
	#print("quitting game")
	get_tree().quit()
