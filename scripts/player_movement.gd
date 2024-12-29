extends CharacterBody2D


var SPEED = 130.0
const JUMP_VELOCITY = -300.0
const standing = 0
var direction = 0
var running_direction = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var anim = $AnimationPlayer
func _ready():
	pass


func _physics_process(delta):
	move_and_slide()
	
	if velocity.length() > 0:
		anim.play("walking")
		print("walking")
		print(velocity)
	else:
		anim.play("idle")
		print("idle")
		print(velocity)
	# Add the gravity.
	
	# flipping of the sprite
	if velocity.x > 0:
		$PlayerSprite.flip_h = false
	else:
		$PlayerSprite.flip_h = true
