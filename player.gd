extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentCell = 0
var health = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	var playerCell = Global.cellDict[currentCell]
	position = playerCell.position
	if playerCell.inWater:
		health -= 0.1
		print(health)
func _input(event):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
