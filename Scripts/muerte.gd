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
