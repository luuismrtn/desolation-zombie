extends Node

var segundos: int
var puntos: int
var vida: int

var maps = ["Bunker", "Cabana"]
var mapa = "Cabana"

var round = 1
var global_points: int
var best_score: int

func _ready():
	load_best_score()

func start():
	var selected_map = maps[randi() % maps.size()]
	var scene_path = "res://Escenas/" + selected_map + ".tscn"
	mapa = selected_map
	
	segundos = 20
	puntos = 0
	vida = 10
	
	if round == 1:
		global_points = 0
	
	get_tree().change_scene_to_file(scene_path)

func save_best_score():
	var save_score = FileAccess.open("user://best_score.save", FileAccess.WRITE)
	save_score.store_64(best_score)
	save_score.close()

func load_best_score():
	var save_score = FileAccess.open("user://best_score.save", FileAccess.READ)
	best_score = save_score.get_64()
	save_score.close()
