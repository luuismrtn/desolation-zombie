extends Control

func _ready():
	$Label.text = "Round %s" % Global.round
	Global.global_points += Global.puntos + Global.vida

func _process(delta):
	if($"Next".position.x < 828):
		$"Next".position.x += 20
	if($"Level".position.x > 1142):
		$"Level".position.x -= 20
	if($"Label".position.y > 736):
		$"Label".position.y -= 20


func _on_timer_timeout():
	var maps = Global.maps
	var selected_map = maps[randi() % maps.size()]
	var scene_path = "res://Escenas/" + selected_map + ".tscn"
	Global.mapa = selected_map
	Global.start()
	get_tree().change_scene_to_file(scene_path)
