extends KinematicBody2D


var motion = Vector2(0,0)
const SPEED = 600
const GRAVITY = 35
const UP = Vector2(0, -1)
const JUMP_SPEED = 1400
const WORLD_LIMIT = 4000


signal animate 


func _physics_process(delta: float) -> void:
	move()
	apply_gravity()
	jump()
	animate()
	move_and_slide(motion, UP)
	


func move():
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	else:
		motion.x = 0

func apply_gravity():
	if position.y > WORLD_LIMIT:
		end_game()
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY


func jump():
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y -= JUMP_SPEED
		

func animate():
	emit_signal("animate", motion)
	

func end_game():
	get_tree().change_scene("res://levels/GameOverScreen.tscn")

