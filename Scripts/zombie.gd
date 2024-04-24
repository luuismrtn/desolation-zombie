extends CharacterBody2D

@export var speed = 200
var accel = 7

@onready var navigation_agent_2d = $NavigationAgent2D

var objetivo

func _ready():
	objetivo = get_node("../Player")
	set_physics_process(true)
	
func _physics_process(delta):
	var direction = Vector2()
	
	navigation_agent_2d.target_position = objetivo.global_position
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
