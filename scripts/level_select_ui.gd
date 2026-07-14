extends Control

@export var level_select_ui: Control
var menu: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu = preload("res://scenes/menu_ui.tscn").instantiate()

func _on_back_button_pressed() -> void:
	get_parent().add_child(menu)
	level_select_ui.queue_free()
	print("back to menu")
