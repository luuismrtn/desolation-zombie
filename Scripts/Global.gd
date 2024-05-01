extends Node

@export var barraVida_path: NodePath 

func change_heart_bar(new_value) -> void:
	var barraVida: Range = get_node(barraVida_path)
	barraVida.value = new_value / 0.04
