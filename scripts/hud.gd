extends CanvasLayer

@export var score_label: Label
var score: int = 0

func add_score():
	score += 1 
	score_label.text  = str(score) + " x Coins"
