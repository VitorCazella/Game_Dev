extends Control

onready var player_vars = get_node("/root/GameData")

onready var score = $VBoxContainer/Score
onready var deaths = $VBoxContainer/Deaths

func _ready():
	deaths.text = "Deaths: " + String(player_vars.deaths)
	score.text = "Score: " + String(player_vars.score) + "\n\n"

func _on_Button_pressed():
	player_vars.restartVars()
	get_tree().change_scene("res://src/Level.tscn")
	pass


func _on_MenuButton_button_up():
	get_tree().change_scene("res://src/StartScreen.tscn")
	pass # Replace with function body.
