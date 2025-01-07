extends Node

@onready var health_progress_bar = $HealthProgressBar
@onready var damage_indicator_progress_bar = $HealthProgressBar/DamageIndicatorProgressBar
@onready var damage_delay_timer = $DamageDelayTimer

var current_life: float
var max_life: float

func _ready():
	# Connect the timer timeout signal to the function
	damage_delay_timer.timeout.connect(on_damage_delay_timeout)

func set_max_life(value: float):
	max_life = value
	health_progress_bar.max_value = max_life
	damage_indicator_progress_bar.max_value = max_life

func update_health(life: float):
	current_life = life
	health_progress_bar.value = current_life

	# Start the timer to update the damage indicator after a delay
	damage_delay_timer.start()

func on_damage_delay_timeout():
	# Update the damage indicator to match the current health
	damage_indicator_progress_bar.value = current_life
