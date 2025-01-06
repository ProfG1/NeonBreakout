extends EnemyState
var angle_cone_of_vision := deg_to_rad(30.0)
var max_view_distance := 800
var angle_between_rays := deg_to_rad(5.0)

var target: Player = null
@onready var _ray := RayCast2D.new()

func _physics_process(delta: float) -> void:
	var cast_count := int(angle_cone_of_vision / angle_between_rays) + 1
	
	for index in cast_count:
		var cast_vector := (
			max_view_distance
			* Vector2.UP.rotated(angle_between_rays * (index - cast_count / 2.0))
			)

		_ray.cast_to = cast_vector
		_ray.force_raycast_update()
		if _ray.is_colliding() and _ray.get_collider() is Player:
			target = _ray.get_collider()
			transition_to_chase(target)
			 
func transition_to_chase(player: Player) -> void:
	transitioned.emit(self, "chase")
	print("Transitioning to chase state")
