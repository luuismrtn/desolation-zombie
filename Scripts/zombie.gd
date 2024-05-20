extends CharacterBody2D

@export var speed = 200
var accel = 7

@onready var navigation_agent_2d = $NavigationAgent2D

var target
var strong: bool
var damage: int
var round_amp = Global.num_round - 1

var strong_probrability = 0.7 + (round_amp * 0.05)

func _ready():
	if(randf_range(0,1) > strong_probrability):
		strong = true
		damage = 10 + (round_amp * 2)
		$ZombieSkin.texture = load("res://Sprites/Zombie/Zombi fuerte.png")
		$ZombieSkin/AnimatedSprite2D.sprite_frames = load("res://Sprites/Zombie/zombieFuerteWalk.tres")
	else:
		strong = false
		damage = 5 + (round_amp * 2)
		$ZombieSkin.texture = load("res://Sprites/Zombie/Zombi debil.png")
	target = get_tree().root.get_node("/root/"+ Global.map +"/Player")

	
func _physics_process(delta):
	var direction = Vector2()
	
	navigation_agent_2d.target_position = target.global_position
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
	$ZombieSkin/AnimatedSprite2D.play()
	
	var angle_to_player = direction.angle()
	rotation = angle_to_player

