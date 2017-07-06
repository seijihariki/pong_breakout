
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
		set_bbcode("[center][color=green]" + str(l_score) + "[/color]:[color=red]" +  str(r_score) + "[/color][/center]")
		Globals.set("game_over_text", "[center]Player 2 [color=red]DEFEATED[/color][/center]")
	elif l_score < r_score:
		set_bbcode("[center][color=red]" + str(l_score) + "[/color]:[color=green]" +  str(r_score) + "[/color][/center]")
		Globals.set("game_over_text", "[center]Player 1 [color=red]DEFEATED[/color][/center]")
	else:
		set_bbcode("[center]" + str(l_score) + ":" +  str(r_score) + "[/center]")
		Globals.set("game_over_text", "[center]Both players [color=red]SUCK[/color][/center]")
		pass