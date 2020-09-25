extends Node2D

onready var player_vars = get_node("/root/GameData")

func _ready():
	pass

func _process(delta):
	if player_vars.numberOfAsteriods == 0:
		get_tree().change_scene("res://src/NextLevel.tscn")
