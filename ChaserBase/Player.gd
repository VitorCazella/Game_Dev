extends KinematicBody2D

const MOVE_SPEED = 300

onready var enemies = get_tree().get_nodes_in_group("enemies")

var pause = false

func _ready():
	yield(get_tree(), "idle_frame") # wait for scene tree to load before continuing
	get_tree().call_group("enemies", "set_player", self) # call set_player method on all Nodes in the "enemies" group
	

func _process(delta):
	enemies = get_tree().get_nodes_in_group("enemies")

func _physics_process(delta):
	var move_vec = Vector2()
	
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().quit()
	
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
		
	if Input.is_action_just_pressed("f"):
		if enemies[1].follow:
			get_tree().call_group("enemies", "set_follow", false)
		else:
			get_tree().call_group("enemies", "set_follow", true)
		
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	#print(move_vec.get_position())
