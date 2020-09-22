extends Control

onready var tree = get_tree()
onready var player_vars = get_node("/root/GameData")

export (String, FILE) var level


func _ready():
	pass # Replace with function body.


func _on_play_button_up():
	player_vars.score = 0
	tree.change_scene(level)
	pass # Replace with function body.


func _on_credits_button_up():
	tree.change_scene("res://src/Credits.tscn")
	pass # Replace with function body.
