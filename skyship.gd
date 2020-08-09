extends KinematicBody2D

onready var windpath = get_node("/root/root/wind/trail")

func _ready():
	pass
	
var movement = Vector2()
func _process(delta):
	move_and_slide(movement)

func _on_Area2D_area_entered(area):
	if area.name=="bomb-area" or area.name == "missile-area":
		get_node("/root/root").reload()
	elif area.name == "wind-area":
		var direction = (windpath.points[-1]-windpath.points[-2]).normalized()
		movement = direction*250
		
