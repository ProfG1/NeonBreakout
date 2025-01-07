extends EnemyState

var angle_cone_of_vision := deg_to_rad(30.0)
var max_view_distance := 800
var angle_between_rays := deg_to_rad(5.0)
var target: Player = null
var is_in_detection_radius := false

@export var _ray: RayCast2D

func _ready():
	player = get_node('/root/Game/Player')
	
	# Ensure the RayCast2D node is enabled
	_ray.enabled = true
	print("RayCast2D enabled")
	
	# Connect signals from DetectionRadius
	var detection_radius = enemy.get_node("DetectionRadius")

func _physics_process(delta: float) -> void:
	if is_in_detection_radius:
		# Perform a broad check to see if the player is in front of the enemy
		if is_player_in_front():
			# Calculate the number of rays to cast
			var cast_count := int(angle_cone_of_vision / angle_between_rays) + 1
			
			# Sweep the area with multiple rays
			for index in range(cast_count):
				var angle := angle_between_rays * (index - cast_count / 2.0)
				var cast_vector := max_view_distance * Vector2.UP.rotated(angle)
				
				_ray.target_position = cast_vector
				_ray.force_raycast_update()
				
				if _ray.is_colliding() and _ray.get_collider() is Player:
					target = _ray.get_collider()
					transition_to_chase(target)
					return  # Exit early if player is detected

func is_player_in_front() -> bool:
	var to_player = player.global_position - enemy.global_position
	var forward = enemy.global_transform.x
	return forward.dot(to_player) > 0

func transition_to_chase(player: Player) -> void:
	transitioned.emit(self, "chase")
	print("Transitioning to chase state")

func _on_DetectionRadius_body_entered(body: Node) -> void:
	if body is Player:
		is_in_detection_radius = true
		print("Player entered detection radius")

func _on_DetectionRadius_body_exited(body: Node) -> void:
	if body is Player:
		is_in_detection_radius = false
		print("Player exited detection radius")
