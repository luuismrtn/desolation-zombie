extends Control

var puntuacion: int

func _ready():
	$MusicaMuerte.play()
	puntuacion = Global.puntos + Global.global_points
	$your_score.text = str(puntuacion)

