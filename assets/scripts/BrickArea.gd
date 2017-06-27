extends YSort

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var brick = preload('res://assets/scenes/Brick.tscn')
var bricks = Array()

var scale = .5

export(int) var brk_max_vel = -7

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for i in range(2):
		for j in range(400):
			new_brick_on_coords(j*5 - 200, 21*i)
			pass
		pass

	set_fixed_process(true)
	pass

var time = 0

func _fixed_process(delta):
	move_local_y(delta*brk_max_vel*(sin(PI*time/30) + 1)/2)
	time += delta
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