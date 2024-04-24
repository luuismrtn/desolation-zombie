extends CharacterBody2D

@export var speed = 400

func get_input(delta):
	var move_dir = Vector2()
	
	if Input.is_action_pressed("left"):
		move_dir.x -= 1

	if Input.is_action_pressed("right"):
		move_dir.x += 1

	if Input.is_action_pressed("up"):
		move_dir.y -= 1

	if Input.is_action_pressed("down"):
		move_dir.y += 1
	
	move_dir = move_dir.normalized()
	position += move_dir * speed * delta
	
func get_rotation_camera():
	var mouse_position = get_global_mouse_position()
	
	var direction_to_mouse = (mouse_position - global_position).normalized()

	var angle_to_mouse = direction_to_mouse.angle()

	rotation = angle_to_mouse

func _physics_process(delta):
	get_input(delta)
	get_rotation_camera()
	move_and_collide(velocity * delta)
