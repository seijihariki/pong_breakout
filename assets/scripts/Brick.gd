extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var sprite = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_color(color):
	if sprite == 0:
		sprite = get_node("Sprite")
		pass
	sprite.set_modulate(color)
	pass
	
func _get_global_pos():
	return get_global_pos()