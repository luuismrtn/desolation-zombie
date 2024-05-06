extends Control

@export var jugadorUI_scene: PackedScene
@export var casa_scene: PackedScene

var score: int
var vida: int
var tiempo: int
var puntuacion: int
var player = null

func _ready():
	player = casa_scene.get_node("Player")
	
	
func _player_dead():
	tiempo = player.get_node("Tiempo/Tiempo_label").text.to_int()
	print(tiempo)

	# Obtener el valor de los puntos del jugadorUI
	score = player.get_node("Puntos/Puntos_label").text.to_int()

	# Obtener el valor de la vida del jugadorUI
	vida = player.get_node("barraVida").value

	# Calcular la puntuación final
	calcularPuntuacion()
	

func calcularPuntuacion():
	puntuacion = score + vida + tiempo
	$puntos_actual.text = str(puntuacion)
