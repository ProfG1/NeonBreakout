extends Area2D

signal hit_player


@onready var enemy : Enemy = get_owner()


func _ready() -> void:
	area_entered.connect(on_area_entered)# to determine if the enemy area is touching another area likely the player hitbox


func on_area_entered(area: Area2D):
	if area is Player_Hitbox:
		var attack := Attack.new()#instatiate the node using the attack script
		
		attack.damage = enemy.damage# covert the "attack" damage to bullet damage
		
		#area.damage(attack)# activates the function in the player hit box script while carrying the value pf the "attack"
		print("DAMAGE")
