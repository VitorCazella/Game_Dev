extends Path2D

onready var pathFollow = get_node("PathFollow2D")
onready var enemy = get_parent()

func _process(delta):
	pathFollow.set_offset(pathFollow.get_offset() + enemy.speed * delta)
	pass
