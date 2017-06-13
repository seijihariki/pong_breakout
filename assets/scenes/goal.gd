extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ball = preload('res://assets/scripts/ball.gd')
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

export(int) var p1_score = 0
export(int) var p2_score = 0
export(int) var player_side

func _on_Area2D_body_enter( body ):
	if (body extends ball):
		if (player_side == 1):
			p2_score = p2_score + 1
		else:
			p1_score = p1_score + 1
			 # replace with function body

func get_score():
	return Vector2(p1_score, p2_score)