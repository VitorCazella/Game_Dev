extends KinematicBody2D

onready var UP = Vector2(0,-1)

const GRAVITY = 20
const MAXFALLSPEED = 1000
const SPEED = 500
const JUMP_HEIGHT = 800

var motion = Vector2.ZERO

func _physics_process(delta):
	exit()
	move()
	animate()
	jump()
	gravity()
	motion = move_and_slide(motion, UP)
	pass

func move():
	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x > 0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif motion.x < 0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("stand")

func gravity():
	motion.y += GRAVITY
	if(motion.y > MAXFALLSPEED):
		motion.y = MAXFALLSPEED

func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT

func exit():
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
