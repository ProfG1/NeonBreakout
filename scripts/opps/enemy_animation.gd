extends Node

@export var animated_sprite : AnimatedSprite2D
@onready var enemy : Enemy = get_owner()

func _physics_process(delta: float) -> void:
	if not enemy.alive:
		return

	if enemy.velocity.length() == 0:
		play_animation("idle")
		return

	var direction = get_direction_name(enemy.velocity)
	play_animation("move", direction)

func play_animation(base_animation: String, direction: String = "") -> void:
	var animation_name = base_animation
	if direction != "":
		animation_name += "_" + direction
	animated_sprite.play(animation_name)

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
