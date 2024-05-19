extends Control

func _ready():
	$MusicaMenu.play()
	randomize()

func _on_jugar_pressed():
	Global.start()
	var maps = Global.maps
	var selected_map = maps[randi() % maps.size()]
	var scene_path = "res://Escenas/" + selected_map + ".tscn"
	Global.mapa = selected_map
	get_tree().change_scene_to_file(scene_path)


func _on_salir_pressed():
	get_tree().quit()
