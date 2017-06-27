extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var text = "texto"
var selected = false
var down = null
var up = null

var color = "white"

var action = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_bbcode(text)
	pass

func set_down(button):
	down = button

func set_up(button):
	up = button

func select():
	color = "blue"
	set_text(text)
	selected = true

func selected():
	return selected

func clicked_down():
	if down != null:
		color = "white"
		set_text(text)
		selected = false
		down.select()
	pass

func clicked_up():
	if up != null:
		color = "white"
		set_text(text)
		selected = false
		up.select()
	pass
	
func set_action(f):
	action = f
	pass

func clicked_enter():
	action.apply()
	pass

func set_text(txt):
	text = txt
	set_bbcode("[center][color=" + color + "]" + txt + "[/color][/center]")
	pass
