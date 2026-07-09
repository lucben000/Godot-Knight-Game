extends Control

var settings: Control

func _ready() -> void:
	settings = preload("res://scenes/settings_ui.tscn").instantiate()

func _on_play_button_pressed() -> void:
	pass # Replace with function body.

func _on_settings_button_pressed() -> void:
	#var settingsScene = preload("res://scenes/settings_ui.tscn")
	#var settings = settingsScene.instantiate()
	if has_node("./SettingsUI"):
		settings.visible = true
		print("open settings")
	else:
		add_child(settings)
		print("open settings")

func _on_quit_button_pressed() -> void:
	print("quitting game")
	get_tree().quit()
