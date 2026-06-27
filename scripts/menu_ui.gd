extends Control

var settingsScene = preload("res://scenes/settings_ui.tscn")
var settings = settingsScene.instantiate()
@export var play_button: Button
@export var settings_button: Button
@export var quit_button: Button

func _process(delta: float) -> void:
	if play_button.button_pressed:
		#switch to level 1
		print("playing")
	
	if settings_button.button_pressed:
		#popup settings ui
		
		add_child(settings)
		print("settings")
	
	if quit_button.button_pressed:
		get_tree().quit()
