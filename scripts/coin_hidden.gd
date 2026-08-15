extends Node2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_parent().find_child("Player")

func _on_area_2d_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
	player.hud.add_score()
