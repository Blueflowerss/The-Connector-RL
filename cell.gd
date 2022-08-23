extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var id : int
var connectedTo = {}
export var ropeIds : PoolIntArray = [0]
export var spawnRope = true
export var frozen = false
var inWater = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if frozen:
		$RigidBody2D.mode = RigidBody2D.MODE_STATIC
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	Global.clickedCell = id


func _on_Area2D_input_event(viewport, event, shape_idx):
	Global.clickedCell = id

func _on_Area2D_mouse_entered():
	modulate += Color(10,0,0)


func _on_Area2D_mouse_exited():
	modulate -= Color(10,0,0)
