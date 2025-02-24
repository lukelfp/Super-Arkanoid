extends CharacterBody2D

@export var speed = 400
@onready var spawn_shoot: Timer = $SpawnShoot

func _ready():
	GameManager.on_powerup.connect(spawn_bullet)

func _physics_process(delta: float) -> void:
	velocity.x = 0
	
	if Input.is_action_pressed("left") and GameManager.started:
		velocity.x -= speed
	if Input.is_action_pressed("right") and GameManager.started:
		velocity.x += speed
		
	move_and_collide(velocity * delta)
	
func spawn_bullet():
	spawn_shoot.start()


func _on_spawn_shoot_timeout() -> void:
	spawn_bullet()
