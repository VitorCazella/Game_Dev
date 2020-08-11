extends KinematicBody

const speed = 10
const MAXFALLSPEED = 50

var moviment = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	moviment.y -= 20
	if moviment.y == MAXFALLSPEED:
		moviment.y == MAXFALLSPEED
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		moviment.x = 0
	elif Input.is_action_pressed("ui_up"):
		moviment.x = speed
	elif Input.is_action_pressed("ui_down"):
		moviment.x = -speed
	else:
		moviment.x = lerp(moviment.x, 0, 0.1)
		
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		moviment.z = 0
	elif Input.is_action_pressed("ui_right"):
		moviment.z = speed
	elif Input.is_action_pressed("ui_left"):
		moviment.z = -speed
	else:
		moviment.z = lerp(moviment.z, 0, 0.1)
	
	if Input.is_action_just_pressed("ui_select"):
		moviment.y = 100
	
	move_and_slide(moviment)
