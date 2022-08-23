extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ropeSpawn = preload("res://rope.tscn")
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	var connectingCells = {}
	player = get_tree().get_nodes_in_group("player")[0]
	var cells = get_tree().get_nodes_in_group("cells")
	var number = 0
	for cell in cells:
		cell.connect("input_event",self,"_cellInteract")
		cell.get_node("Area2D").connect("input_event",self,"_cellInteract")
		cell.id = number
		Global.cellDict[cell.id] = cell
		for id in cell.ropeIds:
			if connectingCells.has(id):
				connectingCells[id].append(cell)
			else:
				connectingCells[id] = []
				connectingCells[id].append(cell)
		number += 1
func _cellInteract(view,event,objectId):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			for id in Global.cellDict[Global.currentCell].connectedTo:
				if Global.cellDict[Global.clickedCell].get_instance_id() == id:
					var object = instance_from_id(id)
					Global.currentCell = object.id
					player.currentCell = object.id
					break
		elif event.button_index == BUTTON_RIGHT:
			var currentCell = Global.cellDict[Global.currentCell]
			var clickedCell = Global.cellDict[Global.clickedCell]
			var clickedInstanceId = clickedCell.get_instance_id()
			if clickedInstanceId in currentCell.connectedTo:
				currentCell.connectedTo[clickedInstanceId].queue_free()
				currentCell.connectedTo.erase(clickedInstanceId)
				clickedCell.connectedTo.erase(currentCell.get_instance_id())
			else:
				var rope = ropeSpawn.instance()
				rope.firstObject = currentCell.get_path()
				rope.secondObject = clickedCell.get_path()
				add_child(rope)
				Global.currentRope = rope.get_instance_id()
				currentCell.connectedTo[clickedCell.get_instance_id()] = rope
				clickedCell.connectedTo[currentCell.get_instance_id()] = rope
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
