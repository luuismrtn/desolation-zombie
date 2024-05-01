extends CanvasLayer

#func _ready():
	#load_hearts()

#func load_hearts():
	#no detecta rect (¿Por que?)
	#$Life/Hearts.rect_size.x = Global.hearts * 53
	#$Life/HeartsEmpty.rect_size.x = (Global.max_hearts - Global.hearts) * 53
	#$Life/HeartsEmpty.rect_position.x = $Life/Hearts.rect_position.x + $Life/Hearts.rect_size.x * $Life/Hearts.rect_scale.x
