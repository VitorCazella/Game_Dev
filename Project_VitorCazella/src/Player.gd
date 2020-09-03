extends KinematicBody2D


var MAX_SPEED = 2000
var ACCEL = 500
var motion = Vector2.ZERO

var fps = 60.0 # Initial ideal value for running average
var frame_number = 0;

var sumDelta = 0
#var processCount = 0
var maxProcessDelta = 0;
var nextMileStone = 5;

signal animate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	fpsCount(delta)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCEL * delta * 0.25)
	else:
		rotation = axis.angle()#get_local_mouse_position().angle()
		apply_movement(axis * ACCEL * delta)
	
	animate(axis)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	return axis.normalized()

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

func fpsCount(delta):
	frame_number = frame_number + 1
	sumDelta = sumDelta + delta
	#processCount = processCount + 1
	
	# Skip tracking first second, as scene loading is usually slow.
	if (sumDelta > 1.0):
		if (delta > maxProcessDelta):
			maxProcessDelta = delta
	
	# Average out the FPS with the previous FPS, in this case 90% of the old value, 10% of the current value.
	fps = (fps * 0.9) + (Engine.get_frames_per_second() * 0.1)
	
	# We decide what debug to output based on the current frame number.
	# 1. Output running average FPS every 20th frame.
	# 2. Output average FPS (calculated differently) and minimum FPS every 120 frames.
	# 3. Output the number of seconds every 5 seconds, so we know which lines to use for our logs to send to the lead developer.
	if (frame_number % 20 == 0):
		print('current FPS: ' + str(fps))
	if (frame_number % 120 == 0):
		if sumDelta != 0 and maxProcessDelta != 0:
			print('avg FPS: ' + str(frame_number / sumDelta) + ', min FPS: ' + str(1.0/maxProcessDelta))
	if (sumDelta >= nextMileStone):
		print(str(nextMileStone) + ' seconds\r\n')
		nextMileStone = nextMileStone + 5
	pass
