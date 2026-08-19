extends Node2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var level: Node
var blocks: TileMapLayer
var player: Node2D
var hello

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = get_parent().get_parent()
	blocks = level.get_child(0).find_child("Blocks")
	player = level.find_child("Player")

func _on_area_2d_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
	player.hud.add_score()
	blocks.changeTile()
	
