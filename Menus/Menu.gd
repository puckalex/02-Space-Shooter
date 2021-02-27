extends Control

func _ready():
	pass

func _on_play_pressed():
	get_tree().change_scene("res://Game.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_Input_pressed():
	if Global.mouse == false:
		Global.mouse = true
		$Input.text = "Mouse"
	else:
		Global.mouse = false
		$Input.text = "Keyboard"
