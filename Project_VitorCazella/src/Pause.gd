extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: = get_node("PopupMenu")

var paused: = false setget set_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func _on_restartButton_pressed():
	paused = false
	scene_tree.reload_current_scene()
	pass # Replace with function body.


func _on_exitButton_pressed():
	scene_tree.quit()
	pass # Replace with function body.
