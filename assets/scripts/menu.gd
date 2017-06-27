extends YSort

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var buttons = [get_node("New Game"), get_node("Quit")]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Winner").set_text(Globals.get("game_over_text"))
	get_node("New Game").set_text("New Game")
	get_node("Quit").set_text("Quit")
	set_process_input(true)
	pass

func _input(event):
	if event.is_action_pressed("ui_down"):
		print ("down")
		pass
		
	if event.is_action_pressed("ui_up"):
		print ("up")
		pass
		
	if event.is_action_pressed("ui_accept"):
		print ("enter")
		pass