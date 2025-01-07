class_name Life
extends Node

signal life_changed(life: float)

@export var hitbox : Hitbox
@export var anim : AnimatedSprite2D
@export var max_life := 0
@onready var life : float = max_life

@onready var enemy : Enemy = get_owner()

func _ready():
	if hitbox:
		hitbox.damaged.connect(on_damaged)
	# Emit signal on ready to initialize health bar or other listeners
	emit_signal("life_changed", life)

func on_damaged(attack: Attack):
	if !enemy.alive:
		return
	
	life -= attack.damage
	life = max(life, 0)  # Ensure life does not go below 0
	life_changed.emit(life)
	
	if life <= 0:
		life = 0
		enemy.alive = false
		if anim:
			anim.play("death")
