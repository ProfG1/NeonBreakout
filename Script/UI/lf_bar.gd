extends ProgressBar

@onready var timer = $Timer
@onready var dmgBar = $DmgBar

var lf = 0 : set = _set_lf

func _set_lf(new_lf):
	var prev_lf = lf
	lf = min(max_value, new_lf)
	value = lf
	
	if lf <= 0:
		queue_free()
	
	if lf < prev_lf:
		timer.start()
	else:
		dmgBar.value = lf

func init_life(_lf):
	lf = _lf
	max_value = lf
	value = lf
	dmgBar.max_value = lf
	dmgBar.value = lf

# yes


func _on_timer_timeout():
	dmgBar.value = lf # mk dmg bar catch up to the lf bar
