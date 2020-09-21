extends Control

onready var tree = get_tree()

export (String, FILE) var level


func _ready():
	pass # Replace with function body.


func _on_play_button_up():
	tree.change_scene(level)
	pass # Replace with function body.
