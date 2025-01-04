extends EnemyState


@export var chase_speed := 75.0


func physics_process_state(delta: float):
	print("CHASING")
	
	var direction := player.global_position - enemy.global_position
	
	var distance = direction.length()
	if distance > enemy.chase_radius:
		transitioned.emit(self, "wander")
		return
	
	enemy.velocity = direction.normalized()*chase_speed
	
	if distance <= enemy.follow_radius:
		transitioned.emit(self, "attack")
	#elif distance <= enemy.attack_range:
		#transitioned.emit(self, "attack")
	
	enemy.move_and_slide()
