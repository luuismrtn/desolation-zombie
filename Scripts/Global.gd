extends Node

@onready var pause_scene: PackedScene = preload("res://Scenes/pause.tscn")
var pause_menu
var paused: bool = false

var segundos: int
var puntos: int
var vida: int

var maps = ["Bunker", "Cottage"]
var mapa: String

var num_round = 1
var global_points: int
var best_score: int

func _ready():
	load_best_score()
	pause_menu = pause_scene.instantiate()
	add_child(pause_menu)
	pause_menu.hide()

func start():
	var selected_map = maps[randi() % maps.size()]
	var scene_path = "res://Scenes/" + selected_map + ".tscn"
	mapa = selected_map
	
	segundos = 20
	puntos = 0
	vida = 10
	
	if num_round == 1:
		global_points = 0
		
	get_tree().change_scene_to_file(scene_path)

func save_best_score():
	var save_score = FileAccess.open("user://best_score.save", FileAccess.WRITE)
	save_score.store_64(best_score)
	save_score.close()

func load_best_score():
	if FileAccess.file_exists("user://best_score.save"):
		var save_score = FileAccess.open("user://best_score.save", FileAccess.READ)
		best_score = save_score.get_64()
		save_score.close()
	else:
		save_best_score()
		load_best_score()
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	var current_scene = get_tree().current_scene.name
	if current_scene in maps:
		if paused:
			pause_menu.hide()
			Engine.time_scale = 1
		else:
			pause_menu.show()
			Engine.time_scale = 0
		
		paused = !paused
