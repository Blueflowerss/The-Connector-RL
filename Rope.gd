extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ropeChunk = preload("res://ropeChunk.tscn")
var length = 10
export var softness : float = 2
var beginPoint : Vector2
var endPoint : Vector2
var firstObject = null
var secondObject = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var beginPoint = firstObject.position
	var endPoint = secondObject.position
	var distance = int(beginPoint.distance_to(endPoint))
	var rotation = (endPoint-beginPoint).normalized()
	var ropeChunkLength = int(distance/length)
	var previousLink = null
	for i in range(1,ropeChunkLength):
		var chunk = ropeChunk.instance()
		chunk.rotation = rotation.angle()
		if previousLink != null:
			var pinLeft = chunk.get_node("PinLeft")
			var previousPinRight = previousLink.get_node("PinRight")
			previousPinRight.softness = softness
			pinLeft.softness = softness
			previousPinRight.node_b = chunk.get_path()
			pinLeft.node_b = previousLink.get_path()
		if i == 1 or i == ropeChunkLength-1:
			if i == 1:
				chunk.get_node("PinLeft").node_b = firstObject.get_path()
			if i == ropeChunkLength-1:
				chunk.get_node("PinRight").node_b = secondObject.get_path()

		chunk.position = beginPoint+i*length*rotation
		
		previousLink = chunk
		add_child(chunk)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
