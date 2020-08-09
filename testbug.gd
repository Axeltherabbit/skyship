extends Node2D

var l=[]
func _ready():
	for n in range(10):
		l.append(Vector2(randf(),randf()))

func _process(delta):
	l.append(Vector2(randf(),randf()))
	l.pop_front()
	print(len(l))
