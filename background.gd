extends Node2D

var cloud_textures = []
var cloud_scn = preload("res://cloud.tscn")
var clouds = []
onready var skyship = $skyship

func reset_cloud_pos():
	return Vector2(-randi()%100+skyship.position.x-512,randi()%600)
func reset_cloud_speed():
	return [1,2,0.5,1.5][(randi()+1)%4]
func reset_texture(instance):
	instance.get_node("sprite").set_texture(cloud_textures[randi()%10])

func _ready():
	randomize()
	for i in range(10):
		cloud_textures.append(load("res://img/cloud-%s.png"%i))
	for i in range(10):
		var cloud_instance = cloud_scn.instance()
		cloud_instance.set_position(Vector2(randi()%1024,randi()%600))
		reset_texture(cloud_instance)
		clouds.append({"instance":cloud_instance,"speed": reset_cloud_speed()})
		add_child(cloud_instance)
func _process(delta):
	for cloud in clouds:
		cloud["instance"].set_position(cloud["instance"].position+Vector2(cloud["speed"],0))
		if cloud["instance"].position.x >= skyship.position.x+700:
			cloud["instance"].set_position(reset_cloud_pos())
			cloud["speed"] = reset_cloud_speed()
			reset_texture(cloud["instance"])
			move_child(get_node(cloud["instance"].name),randi()% (len(clouds)+1))
