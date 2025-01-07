extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	# this just enables navigition by up/down keys or a controller if your fancy
	$Bg/VBoxContainer/Play_Game.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_game_pressed():
	#TODO MAKE NEW GAME FILE
	# TODO SHOW GAME SAVED FILES
	print("play game pressed")
	await get_tree().process_frame #  pause the execution until the next frame is about to start
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


func _on_options_pressed():
	# TODO ADD SETTINGS CONFIGS
	pass # Replace with function body.


func _on_achievements_pressed():
	#TODO ADD PLAYER ACHIEVEMENTS
	pass # Replace with function body.


func _on_exit_game_pressed():
	print("exit game pressed")
	get_tree().quit()
	pass # Replace with function body.
