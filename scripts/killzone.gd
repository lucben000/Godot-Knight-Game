extends Area2D

@onready var timer: Timer = $Timer

func _on_area_entered(area: Area2D) -> void:
	print("Game over. You died")
	area.get_node("CollisionShape2D").queue_free()
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
