extends Node2D

onready var scoreHUD = $HUD/Control/Score
onready var asteroidsHUD = $HUD/Control/Asteroids

var score = 0
var numberOfAsteriods = 0


func _ready():
	pass

func _process(delta):
	scoreHUD.text = ("Score: " + String(score))
	asteroidsHUD.text = ("Asteroids left: " + String(numberOfAsteriods))
	if numberOfAsteriods == 0:
		get_tree().change_scene("res://src/Game over.tscn")
