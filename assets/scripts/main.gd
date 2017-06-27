extends YSort

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

var time = 0

func _fixed_process(delta):
	if Globals.get("ball_cnt") <= 0:
		time += delta
		if time > .5:
			get_tree().change_scene("res://assets/scenes/menu.tscn")
		pass
	pass