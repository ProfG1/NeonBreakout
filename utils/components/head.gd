class_name Head
extends Node
signal life_changed(life: float)

@export var hitbox : Area2D
@export var max_life := 0
@onready var life : float = max_life

@export var Player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
