extends Node2D

onready var player_vars = get_node("/root/GameData")

export var speed = 350

func _ready():
	player_vars.numberOfAsteriods += 1
	pass

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	if body.name != "Player":
		queue_free()
		player_vars.score += 100
		player_vars.numberOfAsteriods -= 1
		player_vars.asteroidsDestroyed += 1
	else:
		player_vars.deaths += 1
		player_vars.score -= player_vars.asteroidsDestroyed * 100
		player_vars.numberOfAsteriods = 0
		player_vars.asteroidsDestroyed = 0
		get_tree().reload_current_scene()
