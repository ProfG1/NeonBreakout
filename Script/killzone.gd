extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
@onready var timer = $Timer


func _on_body_entered(body):
	print("YOU DIED") # Replace with function body.
	timer.start()
	body.queue_free()

func _on_timer_timeout():
	get_tree().reload_current_scene()
