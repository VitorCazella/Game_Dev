extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 1000
const SPEED = 20
const MAXSPEED = 300
const JUMP_HEIGHT = 500

var motion = Vector2()
var second_jump = false

var kills = 0
	
func _physics_process(delta):
	$Camera2D/Label.text = "Enemies killed: "+ String(kills)
	#get_input_axis()
	#restart()
	menu()
	
	motion.y += GRAVITY
	if(motion.y > MAXFALLSPEED):
		motion.y = MAXFALLSPEED
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
		motion.x += SPEED
	elif Input.is_action_pressed('ui_left'):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
		motion.x -= SPEED
	else:
		motion.x = lerp(motion.x, 0, 0.1)
		$AnimatedSprite.play("idle")
		
	if is_on_floor():
		second_jump = true
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
	else:
		if(Input.is_action_just_pressed("ui_up") and second_jump):
			motion.y = -JUMP_HEIGHT/2
			second_jump = false
		$AnimatedSprite.play("jump")
		
	motion = move_and_slide(motion, UP)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	print(axis.normalized())
	
func restart():
	if Input.is_action_just_pressed("ui_esc"):
		print("esc restart")
		get_tree().reload_current_scene()

func menu():
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().change_scene("res://scenes/Menu.tscn")

func _on_Feet_body_entered(body):
	print(body)
	body.die()
	kills += 1
