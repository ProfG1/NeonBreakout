extends StateMachine

# Add states to the state machine and initiate with the desired state
func _ready():
	add_state("run")
	add_state("hurt")
	add_state("death")
	await get_tree().process_frame
	call_deferred("set_state", states.run)	
	pass # Replace with function body.

# Contains the current state logic
func _state_logic(delta):
			
	if ![states.death].has(state):
		# This prevents from getting of the scenario sides
		if GlobalValues.current_level != null:
			parent.global_position.x = clamp(parent.global_position.x ,GlobalValues.current_level.level_limit_left	, GlobalValues.current_level.level_limit_right)
			if parent.global_position.y - parent.animated_sprite.frames.get_frame(parent.animated_sprite.animation, parent.animated_sprite.frame).get_height() > GlobalValues.current_level.level_limit_bottom:
				set_state(states.death)
				
		#parent.apply_gravity(delta)
		parent.apply_movement(delta)
	
	if [states.run].has(state):
		parent.apply_horizontal_movement(delta)
	pass

# Make appropriate transitions between states.
func _get_transitions(_delta):
	match state:
		states.hurt:
			if parent.is_on_floor():
				return states.run
	pass

# Function for entering a new state.
func _enter_state(_new_state, _old_state):
	match state:
		states.hurt:
			parent.apply_hurt_knockback()
			parent.animation_player.play("hurt")
		states.death:
			parent.die()
	pass

# State exit function.
func _exit_state(_old_state, _new_state):
	pass
