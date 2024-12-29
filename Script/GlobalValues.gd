extends Node

# We store the size of our tilemap
const CELL_SIZE = 32

var current_level = null
var current_level_name = ''
var level_checkpoint_achieved = false
@onready var gravity = 26 * CELL_SIZE
# These two variables are to set the gravity to all objects affected by physics
# We also set the player jump values here.
#@onready var player_max_jump_height = 3.25 * CELL_SIZE
#@onready var player_min_jump_height = 1.25 * CELL_SIZE
#@onready var player_jump_duration = 0.5
	
#func get_jump_velocity(max_jump_height, min_jump_height):
	#var player_max_jump_velocity = -sqrt(2 * gravity * max_jump_height)
	#var player_min_jump_velocity = -sqrt(2 * gravity * min_jump_height)
	
	#return [player_max_jump_velocity, player_min_jump_velocity]
