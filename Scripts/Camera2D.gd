extends Camera2D

# Variable para almacenar el nodo del jugador
var player

func _ready():
	# Obtener el nodo del jugador usando un NodePath relativo
	player = get_node("../Player")

func _process(delta):
	# Centrar la cámara en la posición del jugador
		position = player.position
