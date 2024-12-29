extends Area2D

@onready var timer = $Timer # yes
@onready var anim = $AnimationPlayer


func _ready():
	timer.wait_time = 2.0  # Time for each animation
	timer.autostart = true
	timer.start()

func _on_body_entered(body: Node) -> void:
	print("YOU DIED")  
	timer.start()
	body.queue_free()
	_on_Timer_timeout()

func _on_Timer_timeout():
	if anim.current_animation == "idle":
		anim.play("activated")
	elif anim.current_animation == "activated":
		anim.play("deactivated")
	else:
		anim.play("idle")

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
