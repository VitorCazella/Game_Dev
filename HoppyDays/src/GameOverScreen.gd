extends Control



func _on_RestartButton_pressed():
	resetGame()
	pass # Replace with function body.


func _on_Button_pressed():
	resetGame()
	pass # Replace with function body.

func resetGame():
	get_tree().change_scene("res://levels/level1.tscn")
	pass
