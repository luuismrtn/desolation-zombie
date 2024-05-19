extends Node

var segundos: int
var puntos: int
var vida: int

var maps = ["Bunker", "Cabana"]
var mapa = "Cabana"

var round = 1
var global_points = 0

func start():
	segundos = 20
	puntos = 0
	vida = 10
