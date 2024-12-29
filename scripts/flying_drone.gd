extends CharacterBody2D
@onready var scanning_area = $ShapeCast2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var ground_detection = $ground_detection
@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var collision_shape2 = $CollisionShape2D2
@onready var ray_castleft = $RayCastleft
@onready var ray_castright = $RayCastright
var timeout = 0
@onready var timer = $Timer
func _on_timer_timeout():
	timeout = 1

# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _physics_process(delta):
	
	
	if ray_castleft.is_colliding() or ray_castright.is_colliding():
		if not is_on_floor():
			velocity.y += gravity * delta
			collision_shape2.disabled = true
			collision_shape.disabled = false
		elif is_on_floor():
			timer.start
			
			if timeout == 1:
				animated_sprite.animation = "turret_mode"
				collision_shape2.disabled = false
				collision_shape.disabled = true
			else:
				timeout = 0
			
		if ray_castleft.is_colliding():
			animated_sprite.flip_h = true
		elif ray_castright.is_colliding():
			animated_sprite.flip_h = false
			
		
			
	move_and_slide()
