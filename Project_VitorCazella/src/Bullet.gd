extends KinematicBody2D

var velocity = Vector2()
export var speed = 1000
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(2)
	velocity.x = speed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_slide(velocity)
	pass

func start_at(dir, pos):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(dir)
	pass

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
