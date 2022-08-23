extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var originalValue = self_modulate
var time = 0
export var colorModifier = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	self_modulate = originalValue + Color(sin(time)*colorModifier.x,sin(time)*colorModifier.y,sin(time)*colorModifier.z) * delta * 0.5
	time += 0.1
	if time > 3600:
		time = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
