extends Area2D

@onready var hud: CanvasLayer = %HUD
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var end_score_label: Label
var gameNode: Node2D
var level: Node
var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameNode = get_tree().root.get_node("/root/Game")
	level = gameNode.get_child(1)
	player = level.find_child("Player")
	end_score_label = level.find_child("EndScreen")

func _on_body_entered(body: Node2D) -> void:
	if end_score_label:
		end_score_label.minus_coins()
	player.hud.add_score()
	animation_player.play("pickup")
