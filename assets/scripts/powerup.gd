extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var goal = preload('res://assets/scenes/goal.gd')
var bar = preload('res://assets/scripts/bar.gd')
var ball_scene = preload('res://assets/scenes/ball.tscn')
var sprite = 0

var type = 0
var color = 0

var vel = Vector2(0, 0)


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func set_right():
	vel = Vector2(70, 0)

func set_left():
	vel = Vector2(-70, 0)

func setColor(color):
	if sprite == 0:
		sprite = get_node("Sprite")
		pass
	sprite.set_modulate(color)
	
func setType(tp):
	print ("Setting type to " + str(tp))
	type = tp

func _set_global_pos(pos):
	set_global_pos(pos)

func _fixed_process(delta):
	set_pos(get_pos() + vel*delta)
	pass
	
func execute(player, pl):
	print ("Executing for player " + String(player))
	print ("Type: " + str(type))
	type = type%3
	if type == 0:
		print ("Creating ball...")
		var ball = ball_scene.instance()
		ball.set_global_pos(Vector2(500, 300))
		get_parent().add_child(ball)
	if type == 1:
		print ("Shrinking player " + str(player))
		return Vector2(.75, 1)

	if type == 2:
		print ("Enlarging player " + str(player))
		return Vector2(1.3, 1)
	return Vector2(1, 1)