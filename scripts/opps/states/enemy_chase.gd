extends EnemyState

@export var wander_speed := 50.0  # Speed for wandering
@export var wander_time := 2.0  # Time to wander in one direction
@export var change_direction_time := 0.0  # Timer to change direction

var wander_direction := Vector2.ZERO

func enter():
	# Set a random initial direction for wandering
	wander_direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
	change_direction_time = wander_time

func physics_process_state(delta: float):
	# Move in the current wander direction
	enemy.velocity = wander_direction * wander_speed
	enemy.move_and_slide()

	# Update the timer to change direction
	change_direction_time -= delta
	if change_direction_time <= 0.0:
		# Change direction
		wander_direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
		change_direction_time = wander_time

# No enemy detection logic here, as it relies on the search state
