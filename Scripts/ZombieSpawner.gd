extends Node2D

const zombie_scene = preload("res://Scenes/zombie.tscn")

var spawnPoints

var random = RandomNumberGenerator.new()

func _ready():
	choose_spawnpoint()
	random.randomize()
	spawn_zombie()

func spawn_zombie():
	var random_spawnpoint = random.randi_range(0, spawnPoints.size() - 1)
	var spawn_position = spawnPoints[random_spawnpoint]
	
	var zombie_instance = zombie_scene.instantiate()
	zombie_instance.position = Vector2(spawn_position[0], spawn_position[1])
	add_child(zombie_instance)

func _on_timer_timeout():
	spawn_zombie()
	
func choose_spawnpoint():
	if Global.map == "Bunker":
		spawnPoints = [[-550, -865], [-550, -690], [-550, -500], [-550, -420], [-550, -317], [-550, -100], [-550, 0], [-550, 75], [-550, 250], [-550, 400], [-550, 600],
[1300, -865], [1300, -690], [1300, -500], [1300, -420], [1300, -317], [1300, -100], [1300, 0], [1300, 75], [1300, 250], [1300, 400], [1300, 600], 
[1200, 700], [1000, 700], [902, 700], [588, 700], [475, 700], [320, 700], [166, 700], [-102, 700], 
[1200, -900], [1000, -900], [902, -900], [588, -900], [475, -900], [320, -900], [166, -900], [-102, -900]]
	elif Global.map == "Cottage":	
		spawnPoints = [[-720, -588], [-720, -438], [-720, -278], [-720, 32], [-720, 160], [-720, 320], [-720, 624], 
[1055, -588], [1055, -438], [1055, -278], [1055, 32], [1055, 160], [1055, 320], [1055, 624],
[1055, 600], [792, 600], [526, 600], [250, 600], [20, 600], [-250, 600], [-350, 600], [-550, 600],
[1055, -770], [792, -770], [526, -770], [250, -770], [20, -770], [-250, -770], [-350, -770], [-550, -770],
[878, -34], [810, 235], [258, -642]]
