extends AnimatedSprite


func _on_Player_animate(motion) -> void:
	if motion:
		play("moving")
	else:
		play("stoped")
	pass
