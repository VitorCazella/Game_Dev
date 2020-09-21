extends Control

onready var tree = get_tree()

export (String, FILE) var level

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_play_button_up():
	tree.change_scene(level)
	pass # Replace with function body.
