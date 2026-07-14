extends Control

@export var menu_ui: Control
var settings: Control
var levels: Control

func _ready() -> void:
	settings = preload("res://scenes/settings_ui.tscn").instantiate()
	levels = preload("res://scenes/level_select_ui.tscn").instantiate()

func _on_play_button_pressed() -> void:
	#add_child(levels)
	get_parent().add_child(levels)
	menu_ui.queue_free()
	print("play game")

func _on_settings_button_pressed() -> void:
	#var settingsScene = preload("res://scenes/settings_ui.tscn")
	#var settings = settingsScene.instantiate()
	add_child(settings)
	print("open settings")

func _on_quit_button_pressed() -> void:
	print("quitting game")
	get_tree().quit()
