extends Area2D

export(String, FILE, "*.tscn") var Scene

onready var playerID = get_tree().get_nodes_in_group("Player")[0].get_instance_id()

func _on_Area2D_body_entered(body):
	print(body.get_instance_id())
	if body.get_instance_id() == playerID:
		get_tree().reload_current_scene()
	else:
		print("not a player")
