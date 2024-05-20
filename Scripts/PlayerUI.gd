extends CanvasLayer

## A brief description of the script

## Variable player
var player

## Function called when the node is added to the scene
func _ready():
	player = get_parent().get_node("Player")
	$health_bar.value = Global.health
	$VBoxContainer/score/score_label.text = str(Global.points)
	$VBoxContainer/time/time_label.text = str(Global.seconds)
	$VBoxContainer/ammo/ammo_label.text = str(player.ammo)
	player.score_changed.connect(update_score)
	player.zombie_hit.connect(update_health)
	player.update_ammo.connect(update_ammo)

## The below function controls the rounds transtitions
func _on_timer_timeout():
	if Global.seconds > 0:
		Global.seconds -= 1
		$VBoxContainer/time/time_label.text = str(Global.seconds)
	else:
		get_tree().change_scene_to_file("res://Scenes/next_level.tscn")
		Global.num_round += 1 

## The below function updates the score
func update_score():
	$VBoxContainer/score/score_label.text = str(Global.points)

## The below function updates health
func update_health():
	$health_bar.value = Global.health

## The below function updates ammo
func update_ammo():
	$VBoxContainer/ammo/ammo_label.text = str(player.ammo)
	

