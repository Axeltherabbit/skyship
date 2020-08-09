extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var velocity = 1

func _process(delta):
	self.position.y += velocity
	if position.y >= 700:
		queue_free()


func _on_Area2D_area_entered(area):
	if area.name == "skyship-collision-box":
		$Sprite.hide()
		$flameparticles.hide()
		$explotionparticles.show()
		velocity = 0
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
