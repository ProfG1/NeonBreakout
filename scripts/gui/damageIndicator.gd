extends ProgressBar


@onready var timer = $Timer
@onready var damage_bar = $DamageIndicator


var life = 0 : set = _set_life

func _set_life(new_life):
	var prev_life = life
	life  = min(max_value, new_life)
	value = life
	
	if value <= 0:
		queue_free()
	
	if life < prev_life:
		timer.start()
	else:
		damage_bar.value = life

func init_life(_life):
	life = _life
	max_value = life
	value = life
	damage_bar.max_value = life
	damage_bar.value = life
	

func _on_timer_timeout():
	damage_bar.value = life

func _on_life_changed(new_life):
	_set_life(new_life)
	
	
