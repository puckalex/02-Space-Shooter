extends Area2D

var speed = 10

func _ready():
	pass

func _physics_process(_delta):
	position.y -= speed
	if position.y < -30:
		queue_free()


func _on_pLazer_body_entered(body):
	body.damage(25)
	queue_free()

