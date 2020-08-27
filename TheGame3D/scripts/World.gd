extends Spatial

var fps = 60.0 # Initial ideal value for running average
var frame_number = 0;

var sumDelta = 0
#var processCount = 0
var maxProcessDelta = 0;
var nextMileStone = 5;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
#	fpsCount(delta)
	if(Input.is_action_just_pressed("ui_cancel")):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().quit()
	if(Input.is_action_just_pressed("restart")):
		get_tree().reload_current_scene()

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
