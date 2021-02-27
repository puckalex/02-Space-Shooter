extends Node

var score = 0
var health = 100
var mouse = false

func _process(delta):
	if Input.is_action_pressed("quit"):	
		get_tree().change_scene("res://Menus/Menu.tscn")
