class_name Hurtbox
extends Area2D

signal hit_enemy


@onready var bullet : Bullet = get_owner()


func _ready() -> void:
	area_entered.connect(on_area_entered)# to determine if the bullet area is touching another area likely the enemy hitbox


func on_area_entered(area: Area2D):
	if area is Hitbox:
		var attack := Attack.new()#instatiate the node using the attack script
		
		attack.damage = bullet.damage# covert the "attack" damage to bullet damage
		
		area.damage(attack)# activates the function in the enemy hit box script while carrying the value pf the "attack"
		
		hit_enemy.emit()# to tell the bullet that it hit the enemy and to disappear
