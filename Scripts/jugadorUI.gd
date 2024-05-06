extends CanvasLayer

var segundos: int

var player = get_parent().get_node("Player")
var puntuacion: int

func _ready():
	$barraVida.value = player.salud
	player.score_changed.connect(_on_score_changed)
	player.dead.connect(_on_dead)
	$Puntos/Puntos_label.text = str(player.puntos)
	$Tiempo/Tiempo_label.text = str(get_parent().segundos)
	segundos = get_parent().segundos

func _on_timer_timeout():
	if get_parent().segundos > 0:
		get_parent().segundos -= 1
		$Tiempo/Tiempo_label.text = str(get_parent().segundos)

func _on_score_changed(new_score):
	$Puntos/Puntos_label.text = str(new_score)
	
func _on_dead():
	calcularPuntuacion()
	emit_signal("player_died", puntuacion)

func calcularPuntuacion():
	var vida = player.salud
	var puntos = $Puntos/Puntos_label.text
	var tiempo = $Tiempo/Tiempo_label.text
	puntuacion = vida + puntos + tiempo
	
