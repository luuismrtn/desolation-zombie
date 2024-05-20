extends Control

var puntuacion: int

func _ready():
	$MusicaMuerte.play()
	puntuacion = Global.puntos + Global.global_points
	
	if (puntuacion > Global.best_score):
		Global.best_score = puntuacion
		Global.save_best_score()
	
	$your_score.text = str(puntuacion)
	$best_score.text = str(Global.best_score)


func _on_restart_pressed():
	Global.round = 1
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
