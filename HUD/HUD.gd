extends Control

func _physics_process(_delta):
	$Score.text = "Score: " + str(Global.score)
	$Health.text = "Health: " + str(Global.health)

func _ready():
	pass
