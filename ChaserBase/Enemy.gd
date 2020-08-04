extends KinematicBody2D

var velocity = Vector2()
var speed = 50

onready var player = get_parent().get_node("Player") # a reference to the player so we can move relative to them

func _ready():
	add_to_group("enemies") # add this Node to the enemies group

func _process(delta):
	if player.position.x > position.x:
		velocity.x += 1
	if player.position.x < position.x:
		velocity.x -= 1
	
	if player.position.y > position.y:
		velocity.y += 1
	if player.position.y < position.y:
		velocity.y -= 1

func _physics_process(delta):
	if player == null: # if we can't find a player, we can't chase them
		print("no player found")
	else:
		velocity = velocity.normalized()
		move_and_collide(velocity * speed * delta)
		
	
	
func set_player(p):
	player = p
