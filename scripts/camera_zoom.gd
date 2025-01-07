extends Node2D


@export var zoom_in_lim := 3
@export var zoom_out_lim := 0.5
@export var zoom_speed := 1.5
@export var cam: Camera2D

var zoom_lvl = 1.0

func _input(event):
	if event.is_action_pressed("zoom_in", true):
		zoom_lvl += get_process_delta_time() * zoom_speed
		
	if event.is_action_pressed("zoom_out", true):
		zoom_lvl -= get_process_delta_time() * zoom_speed
		
	cam.zoom = Vector2(zoom_lvl, zoom_lvl)
	zoom_lvl = clamp(zoom_lvl,zoom_out_lim,zoom_in_lim)
