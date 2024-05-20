extends Control

## A brief description of the script

## Function called when the node is added to the scene
func _ready():
	$Rounds.text = "Round %s" % Global.num_round
	Global.global_points += Global.points + Global.health

## The below function controls the position of the player in the new round
func _process(delta):
	if($"Next".position.x < 828):
		$"Next".position.x += 20
	if($"Level".position.x > 1142):
		$"Level".position.x -= 20
	if($Rounds.position.y > 736):
		$Rounds.position.y -= 20

## The below function start the new round when the timer gets to 0
func _on_timer_timeout():
	Global.start()
