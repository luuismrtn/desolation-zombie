extends CanvasLayer

func _on_resume_pressed():
	hide()
	Global.pauseMenu()


func _on_quit_pressed():
	Global.pauseMenu()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
