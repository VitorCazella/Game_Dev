extends StaticBody2D


# Declare member variables here. Examples:
var flip = true
var start_position
var end_position
var SPEED = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = $".".position.x
	end_position = start_position + 100
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(start_position <= end_position and flip):
		$".".position.x += SPEED
		$AnimatedSprite.flip_h = false
		if($".".position.x >= end_position):
			flip = false
	if($".".position.x >= start_position and !flip):
		$".".position.x -= SPEED
		$AnimatedSprite.flip_h = true
		if($".".position.x <= start_position):
			flip = true
	pass

func die():
	$".".queue_free()
