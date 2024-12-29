extends Node2D

@onready var right_ray_cast = $RightRayCast
@onready var left_ray_cast = $LeftRayCast


const SPEED = 50
var direction = 1

func _process(delta):
	position.x += direction * SPEED * delta
	if right_ray_cast.is_colliding():
		direction = -1
	if  left_ray_cast.is_colliding():
		direction = 1
	position.x += direction * SPEED * delta
