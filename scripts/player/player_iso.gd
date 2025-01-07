extends CharacterBody2D
class_name Player

const SPEED = 400
var motion = Vector2()
var current_dir = "none"
var gun_cooldown = true
var alive = true
var aim_position : Vector2 = Vector2(1, 0)
var speedMultiplier = 1
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var half_viewport = get_viewport_rect().size / 2.0
		aim_position = (event.position - half_viewport)

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var input_vector = Vector2()
	
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_pressed("down"):
		input_vector.y += 1
	if Input.is_action_pressed("up"):
		input_vector.y -= 1

	input_vector = input_vector.normalized()
	velocity = input_vector * (SPEED * speedMultiplier)
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			current_dir = "right"
		elif input_vector.x < 0:
			current_dir = "left"
		elif input_vector.y > 0:
			current_dir = "down"
		elif input_vector.y < 0:
			current_dir = "up"
		play_anim("walk")
	else:
		play_anim("idle")
	
	move_and_slide()

func play_anim(state):
	var anim = $AnimatedSprite2D
	match state:
		"walk":
			if current_dir == "right":
				anim.flip_h = false
				anim.play("walk_right_down")
			elif current_dir == "left":
				anim.flip_h = false
				anim.play("walk_left_down")
			elif current_dir == "down":
				anim.play("walk_down")
			elif current_dir == "up":
				anim.play("walk_up")
		"idle":
			if current_dir == "right":
				anim.flip_h = false
				anim.play("idle_right_down")
			elif current_dir == "left":
				anim.flip_h = false
				anim.play("idle_left_down")
			elif current_dir == "down":
				anim.play("idle_down")
			elif current_dir == "up":
				anim.play("idle_up")
