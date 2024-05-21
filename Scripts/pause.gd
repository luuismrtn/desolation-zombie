extends CanvasLayer

## A brief description of the script

## The below function resume the game when the resume button is pressed
func _on_resume_pressed():
	Global.paused = !Global.paused
	hide()
	Engine.time_scale = 1
	var crosshair_texture = load("res://Sprites/crosshair.png")
	Input.set_custom_mouse_cursor(crosshair_texture, Input.CURSOR_ARROW, Vector2(22, 22))

## The below function quit the game when the quit button is pressed
func _on_quit_pressed():
	Global.pauseMenu()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
