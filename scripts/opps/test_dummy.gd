extends CharacterBody2D

var attack_hit = false
var health = 100
var alive_status = true
var i_frames = true
var health_min = 0
var health_max = 100


func _physics_process(delta: float) -> void:
	if health <= 0:
		queue_free()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("projectile"):
		attack_hit = true
func attacked_by():
	if attack_hit and i_frames == true:
		health = health - 10
		i_frames = false
		$i_frames.start()

func _on_i_frames_timeout() -> void:
	i_frames = true
