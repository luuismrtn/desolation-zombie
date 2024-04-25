extends Node2D

const zombie_scene = preload("res://Escenas/zombie.tscn")

var spawnPoints = [[-810, -240], [810, -240], [810, 240], [-810, 240]]

var random = RandomNumberGenerator.new()

func _ready():
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
