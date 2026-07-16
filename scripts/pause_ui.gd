extends Control

@export var pause_ui: Control
var settings: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settings = load("res://scenes/settings_ui.tscn").instantiate()

func _on_resume_pressed() -> void:
	get_parent().remove_child(pause_ui)
	print("resume")

func _on_settings_pressed() -> void:
	add_child(settings)
	print("open settings")

func _on_quit_pressed() -> void:
	get_tree().quit()
	print("quit game")
