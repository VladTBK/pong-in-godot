extends Line2D

var point_queue: Array
@export var length = 25


func _process(delta):
	global_position = Vector2(0, 0)
	var point = get_parent().global_position
	point_queue.push_front(point)
	if point_queue.size() > length:
		point_queue.pop_back()

	clear_points()
	for pnt in point_queue:
		add_point(pnt)
