extends CharacterBody2D

# Variables de velocidad del jugador
var speed = 400

func _process(delta):
	# Mover hacia la izquierda
	if Input.is_action_pressed("left"):
		position.x -= speed * delta

	# Mover hacia la derecha
	if Input.is_action_pressed("right"):
		position.x += speed * delta

	# Mover hacia arriba
	if Input.is_action_pressed("up"):
		position.y -= speed * delta

	# Mover hacia abajo
	if Input.is_action_pressed("down"):
		position.y += speed * delta

	# Obtener la posición del puntero del ratón en la escena
	var mouse_position = get_global_mouse_position()
	
	# Calcular la dirección hacia el puntero del ratón
	var direction_to_mouse = (mouse_position - global_position).normalized()
	
	# Calcular el ángulo para orientar el sprite del jugador hacia el puntero del ratón
	var angle_to_mouse = direction_to_mouse.angle()

	# Orientar el sprite del jugador hacia el puntero del ratón
	rotation = angle_to_mouse
