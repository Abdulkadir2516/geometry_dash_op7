extends StaticBody2D

@export var jump_force: float = -400.0
@export var gravity: float = 900.0

var velocity: Vector2 = Vector2.ZERO
var is_jumping: bool = false

func _physics_process(delta):
	if is_jumping:
		velocity.y += gravity * delta
		position.y += velocity.y * delta
		
		if position.y >= 300:
			position.y = 300
			velocity = Vector2.ZERO
			is_jumping = false

func _input(event):
	if event.is_action_pressed("zıplama"):
		if not is_jumping:
			velocity.y = jump_force
			is_jumping = tr
