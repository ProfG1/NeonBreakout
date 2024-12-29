extends State
class_name leftwalking
@export var player = PlatformerController2D
@export var SPEED = 130.0
@export var JUMP_VELOCITY = -300.0
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Called when the node enters the scene tree for the first time.
func enter():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Update(delta: float):
	print("Walking Left")
	
func Physics_Update(delta: float):
	pass
