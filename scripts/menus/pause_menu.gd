extends Control

var tween = create_tween()

@onready var spmPrev := $SpamPrevent
@onready var buttons := $ColorRect/VBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	# hides the node or it a  nutshell the game is unpaused
	self.hide()
	for button in $ColorRect/VBoxContainer.get_children():
		# this just assings the signals to the buttons
		button.connect("focus_entered", Callable(self, "_on_button_focus_entered").bind(button))
		button.connect("mouse_entered", Callable(self, "_on_button_mouse_entered").bind(button))
		button.connect("focus_exited", Callable(self, "_on_button_focus_exited").bind(button))

	
func _input(event):
	if Input.is_action_just_pressed("pause") and spmPrev.is_stopped():
		spmPrev.start()
		# function thar sets pause to on or off
		change_pause_state()
		# if the node is visible/pause state then it grabs focus on first button
		if self.visible:
			$ColorRect/VBoxContainer/Continue.grab_focus()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_pressed():
	print("Continue")
	change_pause_state()
	pass # Replace with function body.


func _on_options_pressed():
	# TODO add settings for the player
	pass # Replace with function body.


func _on_exit_to_menu_pressed():
	await get_tree().process_frame
	get_tree().paused = false
	var _change_scene = get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
	pass # Replace with function body.


#simple animation to make it fancy and more responsive to user inputs
#ps still working on it
func _on_button_focus_entered(button):
	tween.tween_property(
		button, 
		"scale:x", 
		1.5,  # Final value
		0.3,   # Duration
	)
	tween.tween_property(
		button, 
		"scale:y", 
		1.5,  # Final value
		0.4,   # Duration
	)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)

func _on_button_focus_exited(button):
	tween.tween_property(
		button, 
		"scale:x", 
		1,  # Final value
		0.4,   # Duration
	)
	tween.tween_property(
		button, 
		"scale:y", 
		1,  # Final value
		0.4,   # Duration
	)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)


func _on_button_mouse_entered(button):
	button.grab_focus()

func change_pause_state():
	# When we pause, we pause everything, so it's important to not pause this node. To do it, go to Inspector > Pause > Mode:Process 
	get_tree().paused = !get_tree().paused
	self.visible = get_tree().paused
