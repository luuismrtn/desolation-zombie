extends Control

var puntuacion: int

# Called when the node enters the scene tree for the first time.
func _ready():
	calcular_puntuacion()
	$puntos_actual.text = str(puntuacion)
	

func calcular_puntuacion():
	if Global.vida == 0:
		puntuacion = Global.puntos
		$resultado.text = "Has perdido"
	else:
		puntuacion = Global.puntos + Global.vida
		$resultado.text = "Has ganado"
