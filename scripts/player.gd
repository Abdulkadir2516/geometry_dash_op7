extends CharacterBody2D

var kontrol = true
func _physics_process(delta):
	
	if Input.is_action_just_pressed("jump"):

		if kontrol:
			kontrol = false
			for i in range(20):
				position.y = position.y-10
				await get_tree().create_timer(0.02).timeout

			for i in range(20):
				position.y = position.y + 10
				await get_tree().create_timer(0.02).timeout
			
			kontrol = true
			
