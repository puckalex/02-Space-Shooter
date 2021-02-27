extends Control

func _ready():
	pass

func _on_play_pressed():
	Global.health = 100
	Global.score = 0
	get_tree().change_scene("res://Game.tscn")

func _on_quit_pressed():
	get_tree().quit()
