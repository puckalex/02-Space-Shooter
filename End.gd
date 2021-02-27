extends Control

func _ready():
	pass

func _enter_tree():
	$Label.text += str(Global.score)

func _on_quit_pressed():
	get_tree().quit()
