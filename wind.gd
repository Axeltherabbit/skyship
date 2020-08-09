extends Node2D

onready var cam = get_node("../position-leveller/skyship/Camera2D")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

var mouseposition = Vector2()
func _input(event):
	print()
	mouseposition = Vector2(cam.global_position.x, 0 )+ get_viewport().get_mouse_position()-Vector2(512,0)


func _process(delta):
	self.position = mouseposition
	
