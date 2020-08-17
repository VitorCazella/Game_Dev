extends KinematicBody2D

var velocity = Vector2()
var speed = 50

var follow = true

var player

func _ready():
	add_to_group("enemies") # add this Node to the enemies group

func _process(delta):
	print($".".name +": " + String(position.distance_to(player.position) - 44)) #distance between enemy and player minus 44 which is the diameter of the enemy
	pass

func _physics_process(delta):
	if player == null: # if we can't find a player, we can't chase them
		#print("no player found")
		pass
	else:
		if follow:
			follow()
		else:
			velocity = Vector2(0,0)
		velocity = velocity.normalized()
		move_and_collide(velocity * speed * delta)

func set_player(p):
	player = p

func get_follow():
	return follow

func set_follow(option):
	follow = option

func follow():
	if player.position.x > position.x:
		velocity.x += 1
	if player.position.x < position.x:
		velocity.x -= 1
	
	if player.position.y > position.y:
		velocity.y += 1
	if player.position.y < position.y:
		velocity.y -= 1
