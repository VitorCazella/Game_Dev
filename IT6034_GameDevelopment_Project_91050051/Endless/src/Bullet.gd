extends KinematicBody2D

var velocity = Vector2()
export var speed = 1000
onready var timer = get_node("Timer")


func _ready():
	timer.start(2)
	velocity.x = speed
	pass

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
	pass
