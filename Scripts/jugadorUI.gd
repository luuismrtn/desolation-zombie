extends CanvasLayer

func _ready():
	if get_parent().has_node("Player"):
		$barraVida.value = get_parent().get_node("Player").salud
	$HBoxContainer/Label.text = str(get_parent().segundos)


func _process(delta):
	$barraVida.value = get_parent().get_node("Player").salud


func _on_timer_timeout():
	if get_parent().segundos > 0:
		get_parent().segundos -= 1
		$HBoxContainer/Label.text = str(get_parent().segundos)
