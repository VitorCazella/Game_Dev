extends Node2D

onready var player = get_node("../..")


func _ready():
	player.numberOfAsteriods += 1
	pass

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	queue_free()
	player.score += 100
	player.numberOfAsteriods -= 1
