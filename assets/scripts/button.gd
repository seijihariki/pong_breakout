extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var text = "texto"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_bbcode(text)
	pass

func set_text(text):
	set_bbcode("[center]" + text + "[/center]")
	pass