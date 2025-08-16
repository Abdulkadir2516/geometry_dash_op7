extends CharacterBody2D

var kontrol = true


func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_just_pressed("jump"):
		$CPUParticles2D.emitting = false
		
		var r = randi_range(0, 255) / 255.0
		var g = randi_range(0, 255) / 255.0
		var b = randi_range(0, 255) / 255.0
		$ColorRect.color = Color(r, g, b)

		if kontrol:
			kontrol = false
			for i in range(10):
				velocity.y = velocity.y - 2
				$".".rotation += 1

				move_and_collide(velocity * 7)
				await get_tree().create_timer(.04).timeout
			
			kontrol = true
			
		$".".rotation = 0
		
		$CPUParticles2D.emitting=true

	if position.y < 500 and not Input.is_action_just_pressed("jump") and kontrol:
		velocity.y += 2

		move_and_collide(velocity * 7)
		await get_tree().create_timer(.1).timeout
			
func dön():
	for i in range(10):
		rotation += 18
		await get_tree().create_timer(0.1).timeout
 
