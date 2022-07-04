extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var zoom_radius = 2000
var radius_required_to_move = 100
func _process(delta):
	var mouse_position = get_global_mouse_position()
	var mouse_delta = mouse_position - global_position
	offset = lerp(offset,(mouse_delta / radius_required_to_move)*zoom_radius* delta,0.1) 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
