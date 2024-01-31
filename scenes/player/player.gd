extends CharacterBody2D

const PLAYER_SPEED = 500


func _ready():
	global_position = Vector2(get_viewport().size.x - 30, get_viewport().size.y * 0.5)


func _process(delta):
	var curr_dir = get_dir()
	velocity = curr_dir * PLAYER_SPEED
	move_and_slide()


func get_dir():
	var y_pos = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(0, y_pos)
