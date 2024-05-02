extends CanvasLayer

func _ready():
	if get_parent().has_node("Player"):
		var player = get_parent().get_node("Player")
		$barraVida.value = player.salud
		player.score_changed.connect(_on_score_changed)
		$Puntos/Label.text = str(player.puntos)
	$Tiempo/Label.text = str(get_parent().segundos)


func _process(delta):
	$barraVida.value = get_parent().get_node("Player").salud


func _on_timer_timeout():
	if get_parent().segundos > 0:
		get_parent().segundos -= 1
		$Tiempo/Label.text = str(get_parent().segundos)

func _on_score_changed(new_score):
	$Puntos/Label.text = str(new_score)
