extends Control

var score: int

func _ready():
	$death_sound.play()
	score = Global.points + Global.global_points
	
	if (score > Global.best_score):
		Global.best_score = score
		Global.save_best_score()
	
	$your_score.text = str(score)
	$best_score.text = str(Global.best_score)


func _on_restart_pressed():
	Global.num_round = 1
	Global.start()

func _on_restart_mouse_entered():
	$Hover.play()

func _on_restart_focus_entered():
	$Pressed.play()
	
func _on_exit_pressed():
	get_tree().quit()

func _on_exit_mouse_entered():
	$Hover.play()

func _on_exit_focus_entered():
	$Pressed.play()
