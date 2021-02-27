extends KinematicBody2D

var Missile = load("res://Missile/Missile.tscn")
onready var Missiles = get_node("/root/Game/Missile")
var PLazer = load("res://pLazer/pLazer.tscn")
onready var PLazers = get_node("/root/Game/PLazer")
var speed = 5
var reloaded = false
var right = true

func _ready():
	pass

func _physics_process(_delta):
	if 0 <= position.x+get_input().x*speed and position.x+get_input().x*speed <= 1024: 
		if Global.mouse == true:
			position.x = get_global_mouse_position().x
		else:
			position += get_input()*speed
	if Input.is_action_pressed("shoot1") and reloaded:
		var missile = Missile.instance()
		missile.position = position
		Missiles.add_child(missile)
		reloaded = false
	if Input.is_action_pressed("shoot2") and reloaded and right:
		var pLazer = PLazer.instance()
		pLazer.position.x = position.x+15
		pLazer.position.y = position.y
		PLazers.add_child(pLazer)
		reloaded = false
		right = false
	if Input.is_action_pressed("shoot2") and reloaded and !right:
		var pLazer = PLazer.instance()
		pLazer.position.x = position.x-15
		pLazer.position.y = position.y
		PLazers.add_child(pLazer)
		reloaded = false
		right = true

func get_input():
	var input_vector = Vector2(0,0)
	if Input.is_action_pressed("left"):
		input_vector.x -= 1.5
	if Input.is_action_pressed("right"):
		input_vector.x += 1.5
	return input_vector.rotated(rotation)

func _on_Reload_timeout():
	reloaded = true

func damage(d):
	Global.health -= d
	$Hbar.rect_size.x -= d/2.5
	if Global.health <= 0:
		get_tree().change_scene("res://Menus/End.tscn")
