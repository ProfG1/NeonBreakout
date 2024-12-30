extends CharacterBody2D


const  SPEED: float = 400.0
var motion = Vector2()
var gun_cooldown = true
var projectile = preload("res://scenes/projectiles/test_projectile.tscn")
func convertCARTtoISO(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y)/2)
	

func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	var input_vector = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_just_pressed("left_mouse") and gun_cooldown:
		gun_cooldown = false
		var projectile_instance = projectile.instantiate()
		projectile_instance.rotation = $Marker2D.rotation
		projectile_instance.global_position = $Marker2D.global_position
		add_child(projectile_instance)
		$gunCooldown.start()
		
		
	
	velocity = input_vector * SPEED
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
