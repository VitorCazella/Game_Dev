extends CanvasLayer

var gamedata = load("res://GameData.gd")

onready var scoreHUD = $Control/Score
onready var asteroidsHUD = $Control/Asteroids

func _ready():
	pass

func _process(delta):
	scoreHUD.text = ("Score: " + String(gamedata.score))
	asteroidsHUD.text = ("Asteroids left: " + String(gamedata.numberOfAsteriods))
	pass
