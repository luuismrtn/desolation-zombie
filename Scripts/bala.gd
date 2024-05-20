extends CharacterBody2D

## A brief description of the script

## Bullet direction
var direction: Vector2

## HIT signal (When bullet hits a zombie)
signal hit

## Bullet velocity
@export var speed: int

## The below function explains the physics of the bullet
func _physics_process(delta):
	velocity = direction.normalized() * speed * delta
	move_and_slide()

## The below function explains what happens when the bullet hits a zombie
func _on_area_2d_body_entered(body):
	if body.is_in_group("zombie"):
		body.queue_free()
		queue_free()
		hit.emit()
	if not body.is_in_group("player"):
		queue_free()
