extends CanvasLayer

## A brief description of the script

## The below function resume the game when the resume button is pressed
func _on_resume_pressed():
	hide()
	Global.pauseMenu()

## The below function quit the game when the quit button is pressed
func _on_quit_pressed():
	Global.pauseMenu()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
