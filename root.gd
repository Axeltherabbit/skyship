extends Node2D


var bombscene = preload("res://bomb.tscn")
var missilescene = preload("res://missile.tscn")

onready var skyship = get_node("position-leveller/skyship")

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func reload():
	get_tree().reload_current_scene()



func _on_missiletimer_timeout():
	var missileinstance = missilescene.instance()
	missileinstance.set_position(Vector2(randi()%1024+skyship.position.x+512,randi()%600))
	add_child(missileinstance)

func _on_finish_area_entered(area):
	if area.name == "skyship-collision-box":
		print("finish")
		skyship.get_node("finish").show()
		get_tree().paused = true



func _on_bombtimer_timeout():
	var bombinstance = bombscene.instance()
	bombinstance.set_position(Vector2(randi()%1024+skyship.position.x-512,-20))
	add_child(bombinstance)
