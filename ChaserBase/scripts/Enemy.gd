extends KinematicBody2D

var velocity = Vector2()

var speed = 100
var follow = true

var player

func _ready():
	$Label.text = $".".name
	add_to_group("enemies") # add this Node to the enemies group
	

func _process(delta):
	#print($".".name +": " + String(position.distance_to(player.position) - 44)) #distance between enemy and player minus 44 which is the diameter of the enemy
	pass

func _physics_process(delta):
	velocity = Vector2()
	if player == null: # if we can't find a player, we can't chase them
		#print("no player found")
		pass
	else:
		if follow:
			#velocity.x += 1 #Make enemies move to the right
			#follow()
			velocity = position.direction_to(player.position) * speed #Make the enemies move towards the player using the calculated vector above.
		else:
			velocity = Vector2(0,0)
		velocity = velocity.normalized()
		move_and_collide(velocity * speed * delta)

func set_player(p):
	player = p

func get_distance():
	return position.distance_to(player.position) - 44

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
