extends Camera2D

## A brief description of the script

## Variable player
var player

## The below function initializates the variable player
func _ready():
	player = get_node("../Player")

## The below function determines the position of the player
func _process(_delta):
		position = player.position
