extends EnemyState






var attack_timer : Timer


# Upon moving to this state, initialize the 
# timer with a random duration.
func enter():
	print("ATTACKING")
	enemy.hurtbox.monitoring = true
	attack_timer = Timer.new()

	attack_timer.wait_time = 1

	attack_timer.timeout.connect(on_timer_finished)
	attack_timer.autostart = true
	add_child(attack_timer)
	


func physics_process_state(delta: float):
	
	pass

func on_timer_finished():
	print("STOPDAMAGE")
	enemy.hurtbox.monitoring = false
	transitioned.emit(self, "chase")

func exit():
	attack_timer.queue_free()
