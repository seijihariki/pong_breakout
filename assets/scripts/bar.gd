extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED_FACTOR = 64

export(int) var speed = 500000
export(String) var up_button = "ui_up"
export(String) var down_button = "ui_down"
export(String) var activate_button = "ui_accept"
export(int) var player = -1

var powerup = preload('res://assets/scripts/powerup.gd')

var init_x = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	init_x = get_pos().x
	set_process_input(true)
	set_fixed_process(true)
	pass


var back_track_force = 5000
var up = false
var down = false
var space = false

func get_player():
	return player

func _input(event):	
	if event.is_action_pressed(up_button):
		apply_impulse(Vector2(0, 0), Vector2(0, -speed))
		up = true
	if event.is_action_released(up_button):
		apply_impulse(Vector2(0, 0), Vector2(0, speed))
		set_linear_velocity(Vector2(0, 0))
		up = false
	if event.is_action_pressed(down_button):
		apply_impulse(Vector2(0, 0), Vector2(0, speed))
		down = true
	if event.is_action_released(down_button):
		apply_impulse(Vector2(0, 0), Vector2(0, -speed))
		set_linear_velocity(Vector2(0, 0))
		down = false
	if event.is_action_pressed(activate_button):
		space = true
	if event.is_action_released(activate_button):
		space = false
	pass

func _fixed_process(delta):
	set_applied_force(Vector2((init_x - get_pos().x)*back_track_force, 0))
	pass

func _on_RigidBody2D_body_enter( body ):
	if body extends powerup:
		var ratio = body.execute(player, self)
		get_node("Sprite").scale(ratio)
		get_node("CollisionShape2D").scale(ratio)
		body.queue_free()
		pass
	pass # replace with function body