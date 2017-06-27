extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var acc = 300

var brick = preload('res://assets/scripts/Brick.gd')

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if Globals.get("ball_cnt") == null:
		print("ball_cnt unset. Creating...")
		Globals.set("ball_cnt", 0)
		pass
	Globals.set("ball_cnt", Globals.get("ball_cnt") + 1)
	
	print("Ball created. Now ", Globals.get("ball_cnt"), " ball(s) in game")
	set_linear_velocity(Vector2(randi()%1000 - 500, randi()%1000 - 500))
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_applied_force(get_linear_velocity().normalized()*acc)
	pass

func _on_body_enter(body):
	pass # replace with function body


func _on_body_exit(body):
	if body extends brick:
		body.queue_free()
		pass
	pass # replace with function body
