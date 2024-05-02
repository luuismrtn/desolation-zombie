extends CharacterBody2D

var direccion: Vector2

signal hit

@export var velocidad: int

func _physics_process(delta):
	velocity = direccion.normalized() * velocidad
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("zombie"):
		body.queue_free()
		queue_free()
		hit.emit()
	if not body.is_in_group("player"):
		queue_free()
