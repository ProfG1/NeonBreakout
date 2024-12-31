extends Node2D
var gun_cooldown = true
var projectile = preload("res://scenes/projectiles/test_projectile.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
	
func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	$gun/crosshair.look_at(mouse_pos)
	$gun.look_at(mouse_pos)
	if Input.is_action_just_pressed("shoot") and gun_cooldown:
		gun_cooldown = false
		var projectile_instance = projectile.instantiate()
		projectile_instance.rotation = rotation
		projectile_instance.global_position = $gun/crosshair.global_position
		add_child(projectile_instance)
		$gunCooldown.start()
		
		
func _on_gun_cooldown_timeout() -> void:
	gun_cooldown = true
