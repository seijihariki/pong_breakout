extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var type = 0
var types = 5

var vel = Vector2(0, 0)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	type = randi()%types
	
	set_fixed_process(true)
	pass

func set_right():
	vel = Vector2(70, 0)

func set_left():
	vel = Vector2(-70, 0)

func _set_global_pos(pos):
	set_global_pos(pos)

func _fixed_process(delta):
	set_pos(get_pos() + vel*delta)
	pass

func _on_Area2D_area_exit( area ):
	pass # replace with function body
