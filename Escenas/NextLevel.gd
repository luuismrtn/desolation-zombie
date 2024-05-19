extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($"Next".position.x < 828):
		$"Next".position.x += 20
	if($"Level".position.x > 1142):
		$"Level".position.x -= 20
	
	pass
