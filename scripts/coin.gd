extends Area2D


@onready var score_label: Label = %ScoreLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var end_score: Label = %EndScreen

func _on_body_entered(body: Node2D) -> void:
	end_score.minus_coins()
	score_label.add_score()
	animation_player.play("pickup")
