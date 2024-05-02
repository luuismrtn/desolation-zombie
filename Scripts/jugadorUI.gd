extends CanvasLayer


func _ready():
	if get_parent().has_node("Player"):
		$barraVida.value = get_parent().get_node("Player").salud


func _process(delta):
	$barraVida.value = get_parent().get_node("Player").salud
