extends Node2D

onready var label = $HUD/Control/Label

var score = 0


func _process(delta):
	label.text = ("Score: " + String(score))
