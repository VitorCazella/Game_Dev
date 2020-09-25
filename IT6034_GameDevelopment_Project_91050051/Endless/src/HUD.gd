extends CanvasLayer

onready var player_vars = get_node("/root/GameData")

onready var scoreHUD = $Control/VBoxContainer/Score
onready var asteroidsHUD = $Control/VBoxContainer/Asteroids
onready var deathsHUD = $Control/VBoxContainer/Deaths

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://src/StartScreen.tscn")
	
	scoreHUD.text = ("Score: " + String(player_vars.score))
	asteroidsHUD.text = ("Asteroids left: " + String(player_vars.numberOfAsteriods))
	deathsHUD.text = ("Deaths: " + String(player_vars.deaths))
	pass
