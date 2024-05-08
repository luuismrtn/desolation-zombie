extends CanvasLayer

var player
var puntuacion: int

func _ready():
	$barraVida.value = Global.vida
	$Puntos/Puntos_label.text = str(Global.puntos)
	$Tiempo/Tiempo_label.text = str(Global.segundos)
	player = get_parent().get_node("Player")
	player.score_changed.connect(update_score)
	player.zombie_hit.connect(update_health)

func _on_timer_timeout():
	if Global.segundos > 0:
		Global.segundos -= 1
		$Tiempo/Tiempo_label.text = str(Global.segundos)
	else:
		get_tree().change_scene_to_file("res://Escenas/muerte.tscn")

func update_score():
	$Puntos/Puntos_label.text = str(Global.puntos)

func update_health():
	$barraVida.value = Global.vida

