extends Area2D

@onready var hud: CanvasLayer = %HUD
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var end_score: Label = %EndScreen
var level: Node
var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = get_parent().get_parent()
	player = level.find_child("Player")

func _on_body_entered(body: Node2D) -> void:
	#end_score.minus_coins()
	player.hud.add_score()
	animation_player.play("pickup")
