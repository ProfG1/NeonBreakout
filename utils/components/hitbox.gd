class_name Hitbox 
extends Area2D

############################################################
# Hitbox component - this gets hit by the bullet's hurtbox.
# Only used by enemies by default, but can be referenced by
# other components to receive damage
############################################################
signal damaged(attack: Attack)


func damage(attack: Attack):
	damaged.emit(attack)
