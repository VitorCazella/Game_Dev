extends StaticBody


func _on_Area_body_entered(body):
	print("entered")
	body.playCoin()
	$".".queue_free()
	pass # Replace with function body.
