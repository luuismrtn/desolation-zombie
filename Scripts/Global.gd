extends Node

## A brief description of the script

## Preload of the pause scene
@onready var pause_scene: PackedScene = preload("res://Scenes/pause.tscn")

## Variable that controls pause
var pause_menu

## Indicates if game is paused or not
var paused: bool = false

## The countdown timer in seconds
var seconds: int

## The player current points
var points: int

## The player current health
var health: int

## A list of maps in the game
var maps = ["bunker", "cottage", "home"]

## The name of the current map
var map: String

## The current round_number
var num_round = 1

## The total point accumulated
var global_points: int

## The highest score recorder
var best_score: int

## Function called when the node is added to the scene
func _ready():
	load_best_score()
	pause_menu = pause_scene.instantiate()
	add_child(pause_menu)
	pause_menu.hide()

## The below function starts a new round
func start():
	var selected_map = maps[randi() % maps.size()]
	var scene_path = "res://Scenes/" + selected_map + ".tscn"
	map = selected_map
	
	seconds = 30
	points = 0
	health = 100
	
	if num_round == 1:
		global_points = 0
		
	get_tree().change_scene_to_file(scene_path)

## The below function saves the best score achieved
func save_best_score():
	var save_score = FileAccess.open("user://best_score.save", FileAccess.WRITE)
	save_score.store_64(best_score)
	save_score.close()

## The below function load the best score
func load_best_score():
	if FileAccess.file_exists("user://best_score.save"):
		var save_score = FileAccess.open("user://best_score.save", FileAccess.READ)
		best_score = save_score.get_64()
		save_score.close()
	else:
		save_best_score()
		load_best_score()

## The below function is called every frame, processes input for pausing the game
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		

## The below function toggles the pause menu and game state
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
