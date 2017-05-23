extends KinematicBody2D

# class member variables go here, for example:
var lvel = Vector2(30, 30)

var avel = .5

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	move(lvel*delta)
	rotate(avel*delta)
	if get_pos().y < 0:
		
		pass
	
	pass