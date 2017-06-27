extends YSort

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var buttons = 0

func new_game():
	get_tree().change_scene("res://assets/scenes/main.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	# Init buttons
	get_node("Winner").set_text(Globals.get("game_over_text"))
	get_node("New Game").set_text("New Game")
	get_node("New Game").set_down(get_node("Quit"))
	get_node("New Game").select()
	get_node("Quit").set_text("Quit")
	get_node("Quit").set_up(get_node("New Game"))
	
	buttons = [get_node("New Game"), get_node("Quit")]
	
	set_process_input(true)
	pass

func find_selected():
	for button in buttons:
		if button.selected():
			return button 

func _input(event):
	if event.is_action_pressed("ui_down"):
		print ("down")
		find_selected().clicked_down()
		pass
		
	if event.is_action_pressed("ui_up"):
		print ("up")
		find_selected().clicked_up()
		pass
		
	if event.is_action_pressed("ui_accept"):
		print ("enter")
		var selected = find_selected()
		if selected.text == "New Game":
			get_tree().change_scene("res://assets/scenes/main.tscn")
		else:
			get_tree().quit()	
		pass