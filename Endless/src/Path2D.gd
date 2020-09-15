extends Path2D

export var speed = 350
onready var pathFollow = get_node("PathFollow2D")

func _process(delta):
	pathFollow.set_offset(pathFollow.get_offset() + speed * delta)
	pass
