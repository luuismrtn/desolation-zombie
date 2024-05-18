extends CharacterBody2D

@export var speed = 200
var accel = 7

@onready var navigation_agent_2d = $NavigationAgent2D

var objetivo

func _ready():
	var mapa = Global.mapa
	objetivo = get_tree().root.get_node("/root/"+ mapa +"/Player")

	
func _physics_process(delta):
	var direction = Vector2()
	
	navigation_agent_2d.target_position = objetivo.global_position
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
	
		# Orientar el sprite del zombie hacia el jugador
	var angle_to_player = direction.angle()
	rotation = angle_to_player
	
