extends YSort

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var brick = preload('res://assets/scenes/Brick.tscn')
var bricks = Array()

var scale = .5
var brk_accel = -7

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for i in range(4):
		for j in range(200):
			new_brick_on_coords(j*5, 9*i)
			pass
		pass

	set_fixed_process(true)
	pass

var brk_vel	= 0

func _fixed_process(delta):
	brk_vel += brk_accel*delta
	move_local_y(brk_vel*delta)
	pass

func new_brick_on_coords(line, column):
	new_brick(Vector2(column*60*scale, (line*120 + (column%2)*60)*scale))
	pass

func new_brick(position):
	var Brick = brick.instance()
	Brick.set_pos(position)
	Brick.set_scale(Vector2(scale, 2*scale))
	Brick.set_color(Color(rand_range(0, 1), rand_range(0, 1), rand_range(0, 1)))
	bricks.push_back(Brick)
	add_child(Brick)
	pass