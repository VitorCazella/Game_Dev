extends KinematicBody

#https://www.youtube.com/watch?v=kDRylbzwkTQ
var view_sensitivity = 0.1
var camera_angle = 0

var velocity = Vector3()
var direction = Vector3()

const SPEED = 20
const ACCEL = 2

func _ready():
	pass

func _physics_process(delta):
	direction = Vector3()
	
	var aim = $head/Camera.get_global_transform().basis
	if Input.is_action_pressed("move_forward"):
		direction -= aim.z
	if Input.is_action_pressed("move_backward"):
		direction += aim.z
	if Input.is_action_pressed("move_left"):
		direction -= aim.x
	if Input.is_action_pressed("move_right"):
		direction += aim.x
	
	direction = direction.normalized()
	
	var target = direction* SPEED
	
	velocity = velocity.linear_interpolate(target, ACCEL * delta)
	
	move_and_slide(velocity)


func _input(event):
	if event is InputEventMouseMotion:
		$head.rotate_y(deg2rad(-event.relative.x * view_sensitivity))
		
		var change = -event.relative.y * view_sensitivity
		if change + camera_angle < 90 and change + camera_angle > -90:
			$head/Camera.rotate_x(deg2rad(change))
			camera_angle += change
