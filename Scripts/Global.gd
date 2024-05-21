extends Node

## A brief description of the script

## Preload of the pause scene
@onready var pause_scene: PackedScene = preload("res://Scenes/pause.tscn")

## Variable that controls pause
var pause_menu

var scene_path: String

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
var map: String = "home"

## The current round_number
var num_round = 1

## The total point accumulated
var global_points: int

## The highest score recorder
var best_score: int

## The volume value
var volume_value: float

## Function called when the node is added to the scene
func _ready():
	load_info()
	
	var current_scene = get_tree().current_scene.name
	if current_scene in maps:
		var crosshair_texture = load("res://Sprites/crosshair.png")
		Input.set_custom_mouse_cursor(crosshair_texture, Input.CURSOR_ARROW, Vector2(22, 22))
	else:
		var cursor_texture = load("res://Sprites/cursor.png")
		Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_ARROW, Vector2(15, 10))
	

## The below function starts a new round
func start():
	choose_map()
	
	seconds = 30
	points = 0
	health = 100
	
	if num_round == 1:
		global_points = 0
		
	get_tree().change_scene_to_file(scene_path)

## The below function chooses a random map.
func choose_map():
	var same = true
	var selected_map
	
	while same:
		selected_map = maps[randi() % maps.size()]
		scene_path = "res://Scenes/" + selected_map + ".tscn"
		if map != selected_map:
			map = selected_map
			same = false

## The below function saves info
func save_info():
	var info = FileAccess.open("user://game_info.save", FileAccess.WRITE)
	info.store_64(best_score)
	info.store_float(volume_value)
	info.close()

## The below function load info
func load_info():
	if FileAccess.file_exists("user://game_info.save"):
		var info = FileAccess.open("user://game_info.save", FileAccess.READ)
		best_score = info.get_64()
		volume_value = info.get_float()
		info.close()
	else:
		best_score = 0
		volume_value = 100
		save_info()
		load_info()

## The below function captures the input
func _input(event):
	if event.is_action_pressed("pause"):
		pauseMenu()

## The below function toggles the pause menu and game state
func pauseMenu():
	var current_scene = get_tree().current_scene.name
	if current_scene in maps:
		if paused:
			pause_menu.queue_free()
			Engine.time_scale = 1
			var crosshair_texture = load("res://Sprites/crosshair.png")
			Input.set_custom_mouse_cursor(crosshair_texture, Input.CURSOR_ARROW, Vector2(22, 22))
		else:
			pause_menu = pause_scene.instantiate()
			add_child(pause_menu)
			Engine.time_scale = 0
			var cursor_texture = load("res://Sprites/cursor.png")
			Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_ARROW, Vector2(15, 10))
		
		paused = !paused
