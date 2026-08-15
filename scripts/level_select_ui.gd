extends Control

@onready var level_select_ui: Control = $"."
@onready var sfx: AudioStreamPlayer = $SFX
var menu: Control
var tutorial: Node
var level1: Node
var fade: CanvasLayer

@export var label_1: Label
@export var label_2: Label
@export var label_3: Label
@export var label_4: Label
@export var label_5: Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu = load("res://scenes/menu_ui.tscn").instantiate()
	tutorial = load("res://scenes/tutorial_level.tscn").instantiate()
	level1 = load("res://scenes/level_1.tscn").instantiate()
	fade = load("res://scenes/fade.tscn").instantiate()
	
	#Locked levels tranpsarency
	#label_1.modulate.a = 0.5
	label_2.modulate.a = 0.5
	label_3.modulate.a = 0.5
	label_4.modulate.a = 0.5
	label_5.modulate.a = 0.5

func _on_back_button_pressed() -> void:
	sfx.play()
	await get_tree().create_timer(0.1).timeout
	get_parent().add_child(menu)
	level_select_ui.queue_free()
	#print("back to menu")

func _on_tutorial_pressed() -> void:
	sfx.play()
	get_tree().root.add_child(fade)
	await get_tree().create_timer(1.0).timeout
	get_parent().add_child(tutorial)
	get_parent().remove_child(level_select_ui)
	#print("tutorial")

func _on_level_1_pressed() -> void:
	sfx.play()
	get_tree().root.add_child(fade)
	await get_tree().create_timer(1.0).timeout
	get_parent().add_child(level1)
	get_parent().remove_child(level_select_ui)
	#print("level 1")

func _on_level_2_pressed() -> void:
	sfx.play()
	print("level 2")

func _on_level_3_pressed() -> void:
	sfx.play()
	print("level 3")

func _on_level_4_pressed() -> void:
	sfx.play()
	print("level 4")

func _on_level_5_pressed() -> void:
	sfx.play()
	print("level 5")
