extends Node2D

@onready var timer_reset: Timer = $TimerReset


func _on_death_zone_body_entered(body: Node2D) -> void:
	if "Ball" in body.name:
		timer_reset.start()
	else: 
		body.queue_free()
	


func _on_timer_reset_timeout() -> void:
	GameManager.started = false
	get_tree().reload_current_scene()
