extends CanvasLayer

@onready var score_label: Label = $ScoreLabel
var score = 0

func add_score():
	score += 1
	score_label.text  = str(score) + " x Coins"
