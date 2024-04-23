extends Sprite2D

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
