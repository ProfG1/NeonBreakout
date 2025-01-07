
extends Limb



@export var max_life := 0
@onready var life : float = max_life

@onready var Parent = get_owner()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
