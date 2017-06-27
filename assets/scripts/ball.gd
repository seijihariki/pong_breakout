extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var acc = 300
var player = 0

var brick = preload('res://assets/scripts/Brick.gd')
var bar = preload('res://assets/scripts/bar.gd')
var powerup = preload('res://assets/scenes/powerup.tscn')

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
		var pos = body._get_global_pos()
		var pu = powerup.instance()
		pu._set_global_pos(pos)
		get_parent().add_child(pu)
		if player == 1:
			pu.set_left()
		else:
			pu.set_right()
		body.queue_free()
		pass
	
	if body extends bar:
		player = body.get_player()
	pass # replace with function body
