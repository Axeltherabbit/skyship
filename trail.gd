extends Line2D


var target
var node
var point
export(NodePath) var targetpath
export(int) var traillength

 
func _ready():
	#init 2 default point for the skyship 
	add_point(Vector2())
	add_point(Vector2())
	target = get_node(targetpath)

func _process(delta):
	global_position = Vector2()
	global_rotation = 0
	point = target.global_position
	add_point(point)
	while get_point_count() > traillength:
		remove_point(0)
