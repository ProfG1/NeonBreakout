extends Area2D

signal hit_player

@onready var enemy : Enemy = get_owner()


func _ready() -> void:
	area_entered.connect(on_area_entered)# to determine if the enemy area is touching another area likely the player hitbox


func on_area_entered(area: Area2D):
	if area is Player_Hitbox:
		var attack := Attack.new()#instatiate the node using the attack script
		var limbType := Limb_type.new()#instattiate a limb node
		attack.damage = enemy.damage# covert the "attack" damage to bullet damage
		limbType.LimbType = randi_range(0, 1)
		
		area.damage(attack, limbType)# activates the function in the player hit box script while carrying the value pf the "attack"
		#area.LimbType(limbType)# activates the func in the player hit box to determine what limb type it hit
		
