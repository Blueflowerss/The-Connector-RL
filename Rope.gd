extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ropeChunk = preload("res://ropeChunk.tscn")
var length = 10
export var softness : float = 2
var beginPoint : Vector2
export var firstObject : NodePath
export var secondObject : NodePath
var endPoint : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawnRope()
func _spawnRope(softnessValue=null):
	var object1 = get_node(firstObject)
	var object2 = get_node(secondObject)
	var beginPoint = object1.position
	var endPoint = object2.position
	if softnessValue != null:
		softness = softnessValue
	var distance = int(beginPoint.distance_to(endPoint))
	var rotation = (endPoint-beginPoint).normalized()
	var ropeChunkLength = int(distance/length)
	var previousLink = null
	object1.connectedTo[object2.get_instance_id()] = self
	object2.connectedTo[object1.get_instance_id()] = self
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
				chunk.get_node("PinLeft").node_b = object1.get_path()
			if i == ropeChunkLength-1:
				chunk.get_node("PinRight").node_b = object2.get_path()
		chunk.position = beginPoint+i*length*rotation
		previousLink = chunk
		add_child(chunk)
func _changeSoftness(value):
	var children = get_children()
	for ropeChunk in children:
		ropeChunk.get_node("PinLeft").softness = value
		ropeChunk.get_node("PinRight").softness = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
