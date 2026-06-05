extends Area2D


@onready var score_label: Label = %ScoreLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	score_label.add_score()
	animation_player.play("pickup")
