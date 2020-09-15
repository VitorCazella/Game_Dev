extends AnimatedSprite

func _ready():
	pass

func _on_Player_animate(motion) -> void:
	if motion:
		play("moving")
	else:
		play("stopped")
	pass
