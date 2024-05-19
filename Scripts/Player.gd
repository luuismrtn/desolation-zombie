extends CharacterBody2D

@export var speed = 400
@export var maxAmmo = 20

signal score_changed
signal zombie_hit
signal update_ammo

const bala_scene = preload("res://Escenas/bala.tscn")

var ammo = maxAmmo
	
func _process(delta):
	get_rotation_camera()
	disparar()

func get_input(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.play()
		if !$Steps.playing:
			$Steps.play()
		velocity.x += 1
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.play()
		if !$Steps.playing:
			$Steps.play()
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		$AnimatedSprite2D.play()
		if !$Steps.playing:
			$Steps.play()
		velocity.y += 1
	if Input.is_action_pressed("up"):
		$AnimatedSprite2D.play()
		if !$Steps.playing:
			$Steps.play()
		velocity.y -= 1
		
	if Input.is_action_just_released("right"):
		$AnimatedSprite2D.stop()
		if $Steps.playing:
			$Steps.stop()
	if Input.is_action_just_released("left"):
		$AnimatedSprite2D.stop()
		if $Steps.playing:
			$Steps.stop()
	if Input.is_action_just_released("down"):
		$AnimatedSprite2D.stop()
		if $Steps.playing:
			$Steps.stop()
	if Input.is_action_just_released("up"):
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
		
		if(ammo > 0):
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
		else:
			$EmptyGun.play()
			if($Timer.is_stopped()):
				$Timer.start(2)
		

func _on_damage_detection_body_entered(body):
	if body.is_in_group("zombie"):
		Global.vida -= 5
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
