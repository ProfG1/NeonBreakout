extends Node

@export var anim : AnimatedSprite2D
@onready var enemy : Enemy = get_owner()

# Store the last direction of movement
var last_direction: String = "down"

func _physics_process(delta: float) -> void:
	if !enemy.alive:
		return

	if enemy.velocity.length() == 0:
		# Play the idle animation based on the last direction
		play_animation("idle", last_direction)
		return

	var direction = get_direction_name(enemy.velocity)
	last_direction = direction
	play_animation("move", direction)

func play_animation(base_animation: String, direction: String = "") -> void:
	var animation_name = base_animation
	if direction != "":
		animation_name += "_" + direction
	anim.play(animation_name)

func get_direction_name(velocity: Vector2) -> String:
	if abs(velocity.x) > abs(velocity.y):
		if velocity.x > 0:
			return "right"
		else:
			return "left"
	else:
		if velocity.y > 0:
			return "down"
		else:
			return "up"
