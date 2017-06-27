extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var l_score = get_node("../Right goal").get_score()
	var r_score = get_node("../Left goal").get_score()
	if l_score > r_score:
		set_bbcode("[color=green]" + str(l_score) + "[/color]:[color=red]" +  str(r_score) + "[/color]")
		Globals.set("game_over_text", "Player 2 [color=red]DEFEATED[/color]")
	elif l_score < r_score:
		set_bbcode("[color=red]" + str(l_score) + "[/color]:[color=green]" +  str(r_score) + "[/color]")
		Globals.set("game_over_text", "Player 1 [color=red]DEFEATED[/color]")
	else:
		set_bbcode(str(l_score) + ":" +  str(r_score))
		Globals.set("game_over_text", "Both players [color=red]DEFEATED[/color]")
		pass