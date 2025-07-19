extends CharacterBody2D

var kontrol = true
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		$CPUParticles2D.emitting = false
		if kontrol:
			kontrol = false
			dön()
			for i in range(25):
				position.y = position.y-10
				await get_tree().create_timer(0.02).timeout

			for i in range(25):
				position.y = position.y + 10
				await get_tree().create_timer(0.02).timeout
			rotation = 0
			kontrol = true
			$CPUParticles2D.emitting=true

		
			
func dön():
	for i in range(10):
		rotation += 18
		await get_tree().create_timer(0.1).timeout
 
