extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ball = preload('res://assets/scripts/ball.gd')
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

var score = 0
export(int) var player_side

func _on_Area2D_body_enter( body ):
	if (body extends ball):
		score = score + 1
		Globals.set("ball_cnt", Globals.get("ball_cnt") - 1)
		print("Ball deleted. Now ", Globals.get("ball_cnt"), " ball(s) in game")
		# replace with function body

func get_score():
	return score