extends Control


func _on_Button_pressed():
	get_tree().change_scene("res://src/Level.tscn")
	pass


func _on_MenuButton_button_up():
	get_tree().change_scene("res://src/StartScreen.tscn")
	pass # Replace with function body.
