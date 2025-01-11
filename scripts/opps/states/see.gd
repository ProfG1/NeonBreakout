extends EnemyState

var player_in_range = false

func _physics_process(delta):
	sightcheck()

func _on_sight_body_entered(body):
	if body == player:
		player_in_range = true
		print("Player is in range", player_in_range)

func _on_sight_body_exited(body):
	if body == player:
		player_in_range = false
		print("Player is out of range", player_in_range)

func sightcheck():
	if player_in_range == true:
		var space_state = get_viewport().find_world_2d().direct_space_state
		var query = PhysicsRayQueryParameters2D.create(enemy.global_position, player.global_position)
		query.exclude = [enemy]  # Exclude the enemy itself
		query.collision_mask 
		
		var sight_check = space_state.intersect_ray(query)
		if sight_check and sight_check.has("collider"):
			if sight_check.collider.name == "Player":
				print("Hit target: ", sight_check.collider)
				emit_signal("transitioned", self, "chase")
			else:
				transitioned.emit(self, "wander")
				print("Hit something else: ", sight_check.collider)
