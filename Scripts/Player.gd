extends CharacterBody2D

@export var speed: int
@export var maxAmmo = 20

signal score_changed
signal zombie_hit
signal update_ammo

const bala_scene = preload("res://Escenas/bala.tscn")

var ammo = maxAmmo

func _ready():
	$Musica.play()
	
func _process(delta):
	get_rotation_camera()
	disparar()
	if Input.is_action_just_pressed("reload"):
		reload()

func get_input(delta):
	var velocity = Vector2.ZERO
	var is_moving = false

	if Input.is_action_pressed("right"):
		velocity.x += 1
		is_moving = true
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
		is_moving = true

	if Input.is_action_pressed("down"):
		velocity.y += 1
		is_moving = true
	elif Input.is_action_pressed("up"):
		velocity.y -= 1
		is_moving = true

	if is_moving:
		$AnimatedSprite2D.play()
		if not $Steps.playing:
			$Steps.play()
	else:
		$AnimatedSprite2D.stop()
		if $Steps.playing:
			$Steps.stop()

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
		if($Timer.is_stopped()):
			$Gunfire.visible = true
			$Gunfire/Timer.start(0.1)
			$Gunshot.play()
			ammo = ammo - 1
			emit_signal("update_ammo")
			var b = bala_scene.instantiate()
			b.global_position = $Marker2D.global_position
			b.direccion = get_global_mouse_position()-$Marker2D.global_position
			b.rotation_degrees = rotation_degrees
			b.hit.connect(update_score)
			get_parent().add_child(b)
			if ammo == 0:
				reload()

func _on_damage_detection_body_entered(body):
	if body.is_in_group("zombie"):
		Global.vida -= 5
		$Hit.play()
		body.queue_free()
		emit_signal("zombie_hit")
	
	if Global.vida <= 0:
		get_tree().change_scene_to_file("res://Escenas/muerte.tscn")

func update_score():
	Global.puntos += 1
	emit_signal("score_changed")


func _on_timer_timeout():
	ammo = maxAmmo
	emit_signal("update_ammo")


func _on_timer_timeout_gunfire():
	$Gunfire.visible = false

func reload():
	$EmptyGun.play()
	if($Timer.is_stopped()):
		$Timer.start(2)
		return
