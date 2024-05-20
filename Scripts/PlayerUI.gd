extends CanvasLayer

var player

func _ready():
	player = get_parent().get_node("Player")
	$health_bar.value = Global.vida
	$VBoxContainer/score/score_label.text = str(Global.puntos)
	$VBoxContainer/time/time_label.text = str(Global.segundos)
	$VBoxContainer/ammo/ammo_label.text = str(player.ammo)
	player.score_changed.connect(update_score)
	player.zombie_hit.connect(update_health)
	player.update_ammo.connect(update_ammo)

func _on_timer_timeout():
	if Global.segundos > 0:
		Global.segundos -= 1
		$VBoxContainer/time/time_label.text = str(Global.segundos)
	else:
		get_tree().change_scene_to_file("res://Escenas/NextLevel.tscn")
		Global.num_round += 1 

func update_score():
	$VBoxContainer/score/score_label.text = str(Global.puntos)

func update_health():
	$health_bar.value = Global.vida
	
func update_ammo():
	$VBoxContainer/ammo/ammo_label.text = str(player.ammo)
	

