extends ProgressBar
var parent
var max_health
var min_health


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	max_health = parent.health_max
	min_health = parent.health_min


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.value = parent.health
	if parent.health != max_health:
		self.visible = true
		if parent.health == min_health:
			self.visible = false
