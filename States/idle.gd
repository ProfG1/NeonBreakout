extends State
class_name idle
@export var player = CharacterBody2D
var leftHold
var rightHold
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Called when the node enters the scene tree for the first time.
func enter():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Update(delta: float):
	print("state = idle")
	
func Physics_Update(delta: float):
	leftHold = Input.is_action_just_pressed("left")
	rightHold = Input.is_action_just_pressed("right")
	if leftHold:
		Transitioned.emit(self, "leftwalking")
	if rightHold:
		Transitioned.emit(self, "rightwalking")
