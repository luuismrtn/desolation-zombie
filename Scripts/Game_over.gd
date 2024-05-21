extends Control

## A brief description of the script

## Variable score
var score: int

## The below function controls the end of the game
func _ready():
	$death_sound.play()
	score = Global.points + Global.global_points
	
	if (score > Global.best_score):
		Global.best_score = score
		Global.save_info()
	
	$your_score.text = str(score)
	$best_score.text = str(Global.best_score)
	
	var cursor_texture = load("res://Sprites/cursor.png")
	Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_ARROW, Vector2(15, 10))

## The below function restart the game
func _on_restart_pressed():
	Global.num_round = 1
	Global.start()

## The below function controls the button appearance
func _on_restart_mouse_entered():
	$Hover.play()

## The below function controls the button appearance
func _on_restart_focus_entered():
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

## The below function controls the button appearance
func _on_home_pressed():
	Global.num_round = 1
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

## The below function controls the button appearance
func _on_home_mouse_entered():
	$Hover.play()

## The below function controls the button appearance
func _on_home_focus_entered():
	$Pressed.play()
