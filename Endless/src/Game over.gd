extends Control

var lastLevel

func _ready():
	connect("currentLevel", self,"_ready")
#	print(currentLevel)
	pass

func _on_Button_pressed():
	#get_tree().change_scene(lastLevel)
	pass
