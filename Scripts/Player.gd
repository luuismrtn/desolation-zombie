extends CharacterBody2D

@export var speed = 400
@export var salud: int = 100

const bala_scene = preload("res://Escenas/bala.tscn")
	
func _process(delta):
	get_rotation_camera()
	disparar()
	

func get_input(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	velocity = velocity.normalized() * speed
	position += velocity * delta

func get_rotation_camera():
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = (mouse_position - global_position).normalized()
	var angle_to_mouse = direction_to_mouse.angle()

	rotation = angle_to_mouse

func _physics_process(delta):
	get_input(delta)
	move_and_collide(velocity * delta)
	
	
func disparar():
	if Input.is_action_just_pressed("disparar"):
		var b = bala_scene.instantiate()
		b.global_position = $Marker2D.global_position
		b.direccion = get_global_mouse_position()-$Marker2D.global_position
		b.rotation_degrees = rotation_degrees
		get_parent().add_child(b)

func _on_damage_detection_body_entered(body):
	if body.is_in_group("zombie"):
		salud -= 5
