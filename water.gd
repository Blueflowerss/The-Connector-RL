extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_water_body_entered(body):
	if "applied_force" in body:
		body.applied_force += Vector2(0,-220)
	if "inWater" in body:
		body.inWater = true

func _on_water_body_exited(body):
	if "applied_force" in body:
		body.applied_force -= Vector2(0,-220)
	if "inWater" in body:
		body.inWater = false
