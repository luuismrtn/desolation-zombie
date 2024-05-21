extends Control

## A brief description of the script

## The below function load the music and best score in the menu.
func _ready():
	$music.play()
	$best_score.text = str(Global.best_score)
	
	var cursor_texture = load("res://Sprites/cursor.png")
	Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_ARROW, Vector2(15, 10))

## The below function starts the scene global when pressed button play
func _on_play_pressed():
	Global.start()
	

## The below function controls the button appearance
func _on_play_mouse_entered():
	$Hover.play()

## The below function controls the button appearance
func _on_play_focus_entered():
	$Pressed.play()

## The below function controls the button appearance
func _on_exit_pressed():
	get_tree().quit()

## The below function controls the button appearance
func _on_exit_mouse_entered():
	$Hover.play()

## The below function controls the button appearance
func _on_exit_focus_entered():
	$Pressed.play()
