extends KinematicBody2D

# class member variables go here, for example:
var lvel = Vector2(50, 50)

var avel = .5

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	move(lvel*delta)
	rotate(avel*delta)
	
	# Collision handling
	var normal = get_collision_normal()
	if normal != Vector2(0, 0):
		lvel -= 2*normal*normal.dot(lvel)
		pass
	
	pass
