extends CharacterBody2D

@export var y_speed = -250
@export var angle = [-200, -250, 250, 300]

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("start") and !GameManager.started:
		play_game()
		
	if GameManager.started:
		var collision = move_and_collide(velocity*delta)
		if collision != null:
			velocity = velocity.bounce(collision.get_normal())
			
			var collided_object = collision.get_collider()
			
			if "Block" in collided_object.name:
				collided_object.queue_free() 

func play_game():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
