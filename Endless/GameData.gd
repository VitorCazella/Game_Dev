extends Node2D

onready var scoreHUD = $HUD/Control/Score
onready var asteroidsHUD = $HUD/Control/Asteroids

var score = 0
var numberOfAsteriods = 0

signal currentLevel

func _ready():
	emit_signal("currentLevel", self.name)

func _process(delta):
	scoreHUD.text = ("Score: " + String(score))
	asteroidsHUD.text = ("Asteroids left: " + String(numberOfAsteriods))
