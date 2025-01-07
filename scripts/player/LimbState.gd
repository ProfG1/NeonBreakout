extends Node

@export var initial_Limb : Limb
signal leftArm_damaged(damage: float)
signal rightArm_damaged(damage: float)
signal leftLeg_damaged(damage: float)
signal rightLeg_damaged(damage: float)
signal body_damaged(damage: float)
signal head_damaged(damage: float)

var current_Limb : Limb
var Limbs : Dictionary = {}
@export var hitbox : Player_Hitbox
@export var anim : AnimatedSprite2D
@export var max_life := 0
@onready var life : float = max_life
@export_group("LIMBS")
@export var rightleg : Limb 
@export var leftleg : Limb
@export var body : Limb
@export var leftarm : Limb
@export var rightarm : Limb
@export var head : Limb

@onready var player : Player = get_owner()

func _ready():
	for child in get_children():
		if child is Limb:
			Limbs[child.name.to_lower()] = child
	if hitbox:
		hitbox.damaged.connect(on_damaged)
		
			
	
func on_damaged(attack: Attack, limbType: Limb_type):
	var limb = limbType.LimbType
	var damage = attack.damage
	print("DAMAGE = ", damage)
	if limb ==  1:
		
		print("Left Leg")
	elif limb == 0:
		
		print("Right Leg")
	#life -= attack.damage
	#life = max(life, 0)  # Ensure life does not go below 0
	
	#if life <= 0:
		#life = 0
		#player.alive = false
		
