class_name Player_Hitbox
extends Area2D




signal damaged(attack: Attack, limbType: Limb_type)


func damage(attack: Attack, limbType: Limb_type):
	damaged.emit(attack, limbType)
	#damaged.emit(limbType)
#func LimbType(limbType: Limb_type):
	

