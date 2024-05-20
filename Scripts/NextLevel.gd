extends Control

func _ready():
	$Rounds.text = "Round %s" % Global.num_round
	Global.global_points += Global.puntos + Global.vida

func _process(delta):
	if($"Next".position.x < 828):
		$"Next".position.x += 20
	if($"Level".position.x > 1142):
		$"Level".position.x -= 20
	if($Rounds.position.y > 736):
		$Rounds.position.y -= 20

func _on_timer_timeout():
	Global.start()
