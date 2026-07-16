extends Control

@export var level_select_ui: Control
var menu: Control
var tutorial: Node

@export var label_1: Label
@export var label_2: Label
@export var label_3: Label
@export var label_4: Label
@export var label_5: Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu = load("res://scenes/menu_ui.tscn").instantiate()
	tutorial = preload("res://scenes/level_1.tscn").instantiate()
	#Locked levels tranpsarency
	label_1.modulate.a = 0.5
	label_2.modulate.a = 0.5
	label_3.modulate.a = 0.5
	label_4.modulate.a = 0.5
	label_5.modulate.a = 0.5

func _on_back_button_pressed() -> void:
	get_parent().add_child(menu)
	level_select_ui.queue_free()
	print("back to menu")

func _on_tutorial_pressed() -> void:
	get_parent().add_child(tutorial)
	get_parent().remove_child(level_select_ui)
	print("tutorial")

func _on_level_1_pressed() -> void:
	print("level 1")

func _on_level_2_pressed() -> void:
	print("level 2")

func _on_level_3_pressed() -> void:
	print("level 3")

func _on_level_4_pressed() -> void:
	print("level 4")

func _on_level_5_pressed() -> void:
	print("level 5")
