extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var acc = 50

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_linear_velocity(Vector2(100, 100))
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_applied_force(get_linear_velocity().normalized()*acc)