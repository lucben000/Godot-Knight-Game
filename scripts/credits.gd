extends Control

var gameNode: Node2D
var menu: Control
var fade: CanvasLayer
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameNode = get_tree().root.get_node("/root/Game")
	menu = load("res://scenes/menu_ui.tscn").instantiate()
	fade = load("res://scenes/fade.tscn").instantiate()
	
	#Start timer to change to next scene, else skipped by user
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Skip credits by pressing ESC
	if Input.is_action_just_pressed("skip"):
		gameNode.add_child(menu)
		queue_free()

#If didn't skip credits, change  to menu scene
func _on_timer_timeout() -> void:
	get_tree().root.add_child(fade)
	await get_tree().create_timer(1.0).timeout
	gameNode.add_child(menu)
	queue_free()
