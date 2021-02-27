extends RigidBody2D

var speed = 2

func _ready():
	pass

func _physics_process(_delta):
	if position.y < -30:
		queue_free()
	


func _on_Missile_body_entered(body):
	body.damage(100)
	queue_free()
