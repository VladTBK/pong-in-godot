extends CharacterBody2D

var BALL_SPEED = 5000
var acc = 1
var max_acc = 1.3
var random_dir = Vector2.ZERO
var score_dict = {"RightBorder": 0, "LeftBorder": 0}
var obj_list = ["Player", "Enemy"]

signal score_updated(hi)

@onready var trail: Line2D = $Trail2D


func _ready():
	reset()


func _physics_process(delta):
	var temp_velocity = velocity
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collider = collision_info.get_collider().name
		if collider in score_dict:
			score_dict[collider] += 1
			reset()
			emit_signal("score_updated", score_dict)
			return
		if collider in obj_list and acc <= max_acc:
			acc += 0.05
			velocity = temp_velocity.bounce(collision_info.get_normal()) * acc
		else:
			velocity = temp_velocity.bounce(collision_info.get_normal())


func generate_random_dir():
	var rand_dir = Vector2.RIGHT.rotated(randf_range(-PI * 0.2, PI * 0.2)).normalized()
	var rand_sign = randi_range(0, 1)
	if rand_sign == 0:
		return -rand_dir
	return rand_dir


func reset():
	trail.clear_points()
	random_dir = generate_random_dir()
	velocity = random_dir * BALL_SPEED
	global_position = Vector2(get_viewport().size.x * 0.5, get_viewport().size.y * 0.5)
	acc = 1
