extends KinematicBody2D

export (NodePath) var joystickPath
onready var joystick : Joystick = get_node(joystickPath)

export var MAX_SPEED = 2000
export var ACCEL = 1000
var motion = Vector2.ZERO

onready var bullet_container = get_node("bullet_container")

signal animate

func _ready():
	pass

func _physics_process(delta):
	var axis = get_input_axis()
	
	if Input.is_action_just_pressed("ui_select"):
		shoot()
	
	if axis == Vector2.ZERO and joystick.output == Vector2.ZERO:
		apply_friction(ACCEL * delta * 1)
	elif axis != Vector2.ZERO:
		rotation = lerp_angle(rotation, axis.angle(), 0.25)
		apply_movement(axis * ACCEL * delta)
	elif joystick.output != Vector2.ZERO:
		rotation = lerp_angle(rotation, joystick.output.angle(), 0.5)
		apply_movement(joystick.output * ACCEL * delta)
		
	animate(motion)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	return axis

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)

func animate(axis):
	emit_signal("animate", axis)

func shoot():
	var projectile = load("res://src/Bullet.tscn")
	var bullet = projectile.instance()
	bullet_container.add_child(bullet)
	bullet.start_at(rotation, global_position)
	pass

func lerp_angle(from, to, weight):
	return from + short_angle_dist(from, to) * weight

func short_angle_dist(from, to):
	var max_angle = PI * 2
	var difference = fmod(to - from, max_angle)
	return fmod(2 * difference, max_angle) - difference


func _on_TextureButton_pressed():
	shoot()
	pass # Replace with function body.
