extends Control

func _ready():
	$MusicaMenu.play()
	$best_score.text = str(Global.best_score)

func _on_jugar_pressed():
	Global.start()
	
func _on_jugar_mouse_entered():
	$Hover.play()
	
func _on_jugar_focus_entered():
	$Pressed.play()

func _on_exit_pressed():
	get_tree().quit()

func _on_exit_mouse_entered():
	$Hover.play()

func _on_exit_focus_entered():
	$Pressed.play()
