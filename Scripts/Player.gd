extends CharacterBody2D

var speed = 400

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	
func get_rotation_camera():
	var mouse_position = get_global_mouse_position()
	
	var direction_to_mouse = (mouse_position - global_position).normalized()

	var angle_to_mouse = direction_to_mouse.angle()

	rotation = angle_to_mouse

func _physics_process(delta):
	get_input()
	get_rotation_camera()
	move_and_collide(velocity * delta)
