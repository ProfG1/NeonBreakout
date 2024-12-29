extends Node2D
@onready var rightraycast = $rightraycast
@onready var leftraycast = $leftraycast


const speed = 60
var direction

func _process(delta):
	position.x += direction * speed
#	
