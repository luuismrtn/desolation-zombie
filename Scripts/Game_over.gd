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
		Global.save_best_score()
	
	$your_score.text = str(score)
	$best_score.text = str(Global.best_score)

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
