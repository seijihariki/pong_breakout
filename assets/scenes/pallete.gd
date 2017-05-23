extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED_FACTOR = 64

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	set_fixed_process(true)
	pass

export(int) var speed = -13
export(int) var player = 1
var up = false
var down = false
var up2 = false
var down2 = false
var space = false

func _input(event):	
	if event.is_action_pressed("ui_up"):
		up = true
	if event.is_action_released("ui_up"):
		up = false
	if event.is_action_pressed("ui_down"):
		down = true
	if event.is_action_released("ui_down"):
		down = false
	if event.is_action_pressed("ui_w"):
		up2 = true
	if event.is_action_released("ui_w"):
		up2 = false
	if event.is_action_pressed("ui_s"):
		down2 = true
	if event.is_action_released("ui_s"):
		down2 = false
	if event.is_action_pressed("ui_accept"):
		space = true
	if event.is_action_released("ui_accept"):
		space = false
		
func _fixed_process(delta):
	if (up && player == 1):
		move(Vector2(0, speed * delta * SPEED_FACTOR))
	if (down && player == 1):
		move(Vector2(0, -speed * delta * SPEED_FACTOR))
	if (up2 && player == 2):
		move(Vector2(0, speed * delta * SPEED_FACTOR))
	if (down2 && player == 2):
		move(Vector2(0, -speed * delta * SPEED_FACTOR))
	