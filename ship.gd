extends RigidBody2D

const ROTATE_SPEED = 250
const ACCELERATION = 5

var size

func _ready():
	size = get_viewport().get_rect().size
	set_fixed_process(true)

func _fixed_process(delta):
	if (Input.is_action_pressed("ui_spin_left")):
		rotate(deg2rad(delta * ROTATE_SPEED))
		
	if (Input.is_action_pressed("ui_spin_right")):
	 	rotate(-deg2rad(delta * ROTATE_SPEED))
	
	if (Input.is_action_pressed("ui_thrust")):
		apply_impulse(Vector2(), Vector2(0, -ACCELERATION).rotated(get_rot()))
		
	var pos = get_pos()
	if (pos.x < 0):
		pos.x = size.x - 1
	if (pos.x > size.x):
		pos.x = 1
	if (pos.y < 0):
		pos.y = size.y - 1
	if (pos.y > size.y):
		pos.y = 1
	set_pos(pos)
