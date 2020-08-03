extends KinematicBody2D

const MOVE_SPEED = 50

var player = $Player.get_position() # a reference to the player so we can move relative to them

func _ready():
	add_to_group("enemies") # add this Node to the enemies group

func _physics_process(delta):
	if player == null: # if we can't find a player, we can't chase them
		print("no player found")
	else:
		print("player")
	
	
func set_player(p):
	player = p
