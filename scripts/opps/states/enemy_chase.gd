extends EnemyState


@export var chase_speed := 75.0


func physics_process_state(delta: float):
	print("CHASING")
	
	var direction := player.global_position - enemy.global_position

	
	enemy.velocity = direction.normalized()*chase_speed
	

	enemy.move_and_slide()
