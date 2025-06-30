extends CharacterBody2D

func _physics_process(delta):
	
	if Input.is_action_just_pressed("jump"):
		
		for i in range(10):
			position.y = position.y-10
			await get_tree().create_timer(0.02).timeout

		await get_tree().create_timer(1).timeout
		
		
		for i in range(10):
			position.y = position.y + 10
			await get_tree().create_timer(0.02).timeout
