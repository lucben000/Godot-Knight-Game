extends Node2D

var speed = 60
@export_range(-1, 1) var direction = 1
var gravity = 150

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var flipped: bool = false

func _ready() -> void:
	animated_sprite_2d.flip_h = flipped

func _physics_process(delta: float) -> void:
	if ray_cast_down.is_colliding() == false:
		position.y += gravity * delta
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * speed * delta
	
