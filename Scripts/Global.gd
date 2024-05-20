extends Node

var segundos: int
var puntos: int
var vida: int

var maps = ["Bunker", "Cabana"]
var mapa = "Cabana"

var round = 1
var global_points = 0
var best_score: int = 0

func _ready():
	load_best_score()

func start():
	segundos = 20
	puntos = 0
	vida = 10

func save_best_score():
	var save_score = FileAccess.open("user://best_score.save", FileAccess.WRITE)
	save_score.store_64(best_score)
	save_score.close()

func load_best_score():
	var save_score = FileAccess.open("user://best_score.save", FileAccess.READ)
	best_score = save_score.get_64()
	save_score.close()
