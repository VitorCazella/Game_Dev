extends Control

onready var player_vars = get_node("/root/GameData")

onready var timer = $Timer
onready var counter = $VBoxContainer/Counter

func _ready():
	timer.start(5)
	pass # Replace with function body.

func _process(delta):
	counter.text = "In " + String(int(timer.time_left))
	pass


func _on_Timer_timeout():
	player_vars.asteroidsDestroyed = 0
	get_tree().change_scene("res://src/Level2.tscn")
	pass # Replace with function body.
