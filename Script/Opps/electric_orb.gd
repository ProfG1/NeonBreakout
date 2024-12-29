extends CharacterBody2D 

# Declaring damage and life
@export var contact_damage = 1
@export var life = 15

# move_direction tells the initial movement direction
var move_direction = -1
@onready var move_speed = 7 * GlobalValues.CELL_SIZE
@onready var hurt_knockback = Vector2(5 * GlobalValues.CELL_SIZE, 0)  # No vertical knockback

@onready var animation_player = $Anime
@onready var animated_sprite = $Body/Sprite2D
var snap_vector = Vector2.ZERO

# Movement functions
func apply_movement(_delta):
	set_velocity(velocity)
	move_and_slide()  # Removes gravity impact
	velocity = velocity
	snap_vector = Vector2.ZERO  # No vertical snap

	if $StateMachine.state == $StateMachine.states.run:
		if self.is_on_wall() or not $Body/FloorRaycast.is_colliding():
			move_direction *= -1		

	$Body.scale.x = -move_direction
	
func apply_horizontal_movement(_delta):
	velocity.x = move_speed * move_direction

# Receive damage and control life
func damage(quantity, damage_dealer):
	life -= quantity
	if life <= 0:
		$StateMachine.set_state($StateMachine.states.death)
	else:
		var knockback_direction = -1 if self.global_position < damage_dealer.global_position else 1
		hurt_knockback.x = knockback_direction * abs(hurt_knockback.x)
		$StateMachine.set_state($StateMachine.states.hurt)
	
func apply_hurt_knockback():
	snap_vector = Vector2()
	velocity = hurt_knockback	

# Get away of trouble nodes that could cause weird behavior and then apply the death animation.	
func die():
	$CollisionShape2D.queue_free()
	$CollideWithPlayer/CollisionShape2D.queue_free()
	$Body/Sprite2D.hide()
	$Body/DeathAnimation.show()
	$Body/DeathAnimation.play("death")
	await $Body/DeathAnimation.animation_finished
	queue_free()
