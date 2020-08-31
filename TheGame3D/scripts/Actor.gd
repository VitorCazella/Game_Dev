extends KinematicBody

#https://www.youtube.com/watch?v=kDRylbzwkTQ
var view_sensitivity = 0.1
var camera_angle = 0

var velocity = Vector3()
var direction = Vector3()

const MAX_SPEED = 10
const MAX_RUNNING_SPEED = 20
const ACCEL = 2
const DEACCEL = 6
const GRAVITY = -9.8 * 3
const WORLD_LIMIT = -30

var jump_height = 15

func _ready():
	pass

func _physics_process(delta):
	walk(delta)
	if translation.y < WORLD_LIMIT:
		end_game()


func _input(event):
	if event is InputEventMouseMotion:
		$head.rotate_y(deg2rad(-event.relative.x * view_sensitivity))
		
		var change = -event.relative.y * view_sensitivity
		if change + camera_angle < 90 and change + camera_angle > -90:
			$head/Camera.rotate_x(deg2rad(change))
			camera_angle += change

func walk(delta):
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
	
	velocity.y += GRAVITY * delta
	
	var temp_velocity = velocity
	temp_velocity.y = 0
	
	var speed
	if Input.is_action_pressed("move_sprint"):
		speed = MAX_RUNNING_SPEED
	else:
		speed = MAX_SPEED
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
		
	var target = direction * speed
	
	var acceleration
	if direction.dot(temp_velocity) > 0:
		acceleration = ACCEL
	else:
		acceleration = DEACCEL
	
	temp_velocity = temp_velocity.linear_interpolate(target, ACCEL * delta)
	
	velocity.x = temp_velocity.x
	velocity.z = temp_velocity.z
	
	# move
	move_and_slide(velocity, Vector3(0, 1, 0))

func fly(delta):
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
	
	var target = direction * MAX_SPEED
	
	velocity = velocity.linear_interpolate(target, ACCEL * delta)
	
	move_and_slide(velocity)
	
func end_game():
	get_tree().reload_current_scene()

func playCoin():
	$AudioStreamPlayer3D.play()
