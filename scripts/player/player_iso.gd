extends CharacterBody2D


const Speed = 400.0
var motion = Vector2()
var gun_cooldown = true
func convertCARTtoISO(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y)/2)


func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	var input_vector = Input.get_vector("left", "right", "up", "down")
	var normalized_vector = input_vector.normalized()
		
		
	
	velocity = normalized_vector * Speed
	#var direction = Vector2()
	#if Input.is_action_just_pressed("up"):
	#	direction += Vector2(0, -1)
	#elif Input.is_action_just_pressed("down"):
	#	direction += Vector2(0, 1)
	#elif Input.is_action_just_pressed("left"):
	#	direction += Vector2(-1, 0)
	#elif Input.is_action_just_pressed("right"):
	#	direction += Vector2(1, 0)
	#print(direction)
	#velocity = direction.normalized() * SPEED * delta
	#direction = convertCARTtoISO(direction)
	
	
	
	
	move_and_slide()


func _on_gun_cooldown_timeout() -> void:
	gun_cooldown = true
