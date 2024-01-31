extends CharacterBody2D

const ENEMY_SPEED_NORMAL = 0.5
const ENEMY_SPEED_HARD = 1


func _ready():
	global_position = Vector2(30, get_viewport().size.y * 0.5)


func _process(delta):
	var ball = get_tree().get_first_node_in_group("ball")
	velocity.y = ball.velocity.y * ENEMY_SPEED_HARD
	move_and_slide()
