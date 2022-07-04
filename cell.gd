extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var id : int
var connectedTo = {}
export var ropeIds : PoolIntArray = [0]
export var spawnRope = true
export var frozen = false
var ropeSpawner = preload("res://rope.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if frozen:
		mode = MODE_STATIC
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	Global.clickedCell = id
