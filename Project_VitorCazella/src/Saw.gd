extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Saw_body_entered(body):
	get_parent().get_parent().enemiesDefeated += 1
	queue_free()
	pass # Replace with function body.
