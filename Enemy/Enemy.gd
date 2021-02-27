extends KinematicBody2D

var health = 100
var ELazer = load("res://Enemy/eLazer.tscn")
onready var ELazers = get_node("/root/Game/ELazer")
var speed = 2

func _ready():
	randomize()

func _physics_process(_delta):
	if position.y < 50:
		position.y += 2

func damage(d):
	health -= d
	$Hbar.rect_size.x -= d/2.5
	if health <= 0:
		Global.score += 100
		queue_free()

func _on_Fire_timeout():
	if randf() < .4:
		var eLazer = ELazer.instance()
		eLazer.position = position
		ELazers.add_child(eLazer)

func _on_Move_timeout():
	if randf() < .15:
		var new_position = Vector2(randi() % 1024, 50)
		$Tween.interpolate_property(self, "position", position, new_position, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		
