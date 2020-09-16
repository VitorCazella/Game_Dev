extends KinematicBody2D

export (NodePath) var path
onready var player = get_node("../../..")

signal despawn

func _on_Area2D_area_entered(area):
	$".".queue_free()
	player.score += 1


var speed = 300
var angular_speed = 0
var _angle_change_timer = null


func _ready():
	# Create a timer to make the node change directions regularly
	_angle_change_timer = Timer.new()
	_angle_change_timer.set_wait_time(5)
	_angle_change_timer.set_one_shot(false)
	_angle_change_timer.connect("timeout", self, "_change_direction")
	add_child(_angle_change_timer)
	_angle_change_timer.start()

	_change_direction()


func _physics_process(delta):
	# Rotate
	rotation = (rotation + angular_speed * delta)
	# Move
	var forward = angle_to_direction(rotation)
	position = (position + forward * speed * delta)
	
	if not get_node("VisibilityNotifier2D").is_on_screen():
		emit_signal("despawn")
		set_process(false)
		queue_free()


func _change_direction():
	angular_speed = rand_range(-PI, PI)


static func angle_to_direction(angle):
	return Vector2(cos(angle), -sin(angle))


func _on_VisibilityNotifier2D_screen_exited():
	print("got out")
	emit_signal("despawn")
	set_process(false)
	queue_free() #Delete raindrops when they get out screen
