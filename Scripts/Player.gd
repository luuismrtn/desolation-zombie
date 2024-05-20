extends CharacterBody2D

@export var speed: int
@export var max_ammo: int
var ammo

signal score_changed
signal zombie_hit
signal update_ammo

const bala_scene = preload("res://Scenes/bullet.tscn")

func _ready():
	ammo = max_ammo
	$Music.play()
	
func _process(delta):
	if not Global.paused:
		get_rotation_camera()
		disparar()
		if Input.is_action_just_pressed("reload"):
			reload()
	

func get_input(delta):
	velocity = Vector2.ZERO
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
			b.direction = get_global_mouse_position()-$Marker2D.global_position
			b.rotation_degrees = rotation_degrees
			b.hit.connect(update_score)
			get_parent().add_child(b)
			if ammo == 0:
				reload()

func _on_damage_detection_body_entered(body):
	if body.is_in_group("zombie"):
		Global.health -= body.damage
		$Hit.play()
		body.queue_free()
		emit_signal("zombie_hit")
	
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func update_score():
	Global.points += 1
	emit_signal("score_changed")


func _on_timer_timeout():
	ammo = max_ammo
	emit_signal("update_ammo")


func _on_timer_timeout_gunfire():
	$Gunfire.visible = false

func reload():
	$EmptyGun.play()
	if($Timer.is_stopped()):
		$Timer.start(2)
		return
