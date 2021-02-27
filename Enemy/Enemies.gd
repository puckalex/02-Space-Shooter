extends Node2D

var Enemy = load("res://Enemy/Enemy.tscn")
var max_enemys = 4

func _ready():
	randomize()

func _on_Spawn_timeout():
	if randf() < .1:
		if get_child_count() < max_enemys:
			var enemy = Enemy.instance()
			enemy.position.y = -15
			enemy.position.x = randi() % 1024
			add_child(enemy)
