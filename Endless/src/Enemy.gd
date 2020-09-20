extends Node2D

export (NodePath) var path
onready var player = get_node(path)


func _ready():
	player.numberOfAsteriods += 1
	pass

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	queue_free()
	player.score += 1
	player.numberOfAsteriods -= 1
