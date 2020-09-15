extends AnimatedSprite

export (NodePath) var path
onready var particles = get_node(path)

func _ready():
	pass

func _on_Player_animate(motion) -> void:
	if motion:
		play("moving")
		particles.set_emitting(true)
	else:
		play("stopped")
		particles.set_emitting(false)
	pass
