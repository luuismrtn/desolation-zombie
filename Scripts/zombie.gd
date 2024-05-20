extends CharacterBody2D

@export var speed = 200
var accel = 7

@onready var navigation_agent_2d = $NavigationAgent2D

var objetivo

var fuerte = false

func _ready():
	if(randf_range(0,1) > 0.7):
		fuerte = true
		$ZombieSkin.texture = load("res://Sprites/Zombie/Zombi fuerte.png")
		$ZombieSkin/AnimatedSprite2D.sprite_frames = load("res://Sprites/Zombie/zombieFuerteWalk.tres")
	var mapa = Global.mapa
	objetivo = get_tree().root.get_node("/root/"+ mapa +"/Player")

	
func _physics_process(delta):
	var direction = Vector2()
	
	navigation_agent_2d.target_position = objetivo.global_position
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()

	var angle_to_player = direction.angle()
	rotation = angle_to_player
	
