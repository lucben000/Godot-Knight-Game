extends Control

var menu: Control
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu = load("res://scenes/menu_ui.tscn").instantiate()
	
	#Start timer to change to next scene, else skipped by user
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Skip credits by pressing ESC
	if Input.is_action_just_pressed("pause"):
		get_tree().root.get_node("/root/Game").add_child(menu)
		queue_free()

#If didn't skip credits, change  to menu scene
func _on_timer_timeout() -> void:
	get_tree().root.get_node("/root/Game").add_child(menu)
	queue_free()
