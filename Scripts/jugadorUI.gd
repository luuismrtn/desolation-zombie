extends CanvasLayer

var segundos: int

func _ready():
	if get_parent().has_node("Player"):
		var player = get_parent().get_node("Player")
		$barraVida.value = player.salud
		player.score_changed.connect(_on_score_changed)
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
	emit_signal("player_died", segundos)
