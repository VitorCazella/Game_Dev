extends Node2D

# Without freeing

var maxY = 1024
var speed
var speedSet = false
signal despawn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rigid = get_node('RigidBody2D')
	var o = rigid.get_global_transform_with_canvas()
	var y = o.get_origin().y
	#print(y)

	if (y > maxY):
		set_process(false)
		emit_signal("despawn")
		queue_free() #Delete raindrops when they get out screen
	pass

func _physics_process(delta):
	if (!speedSet):
		var rigid = get_node('RigidBody2D')
		rigid.set_linear_velocity(Vector2(0, speed))
		speedSet = true
	pass

func set_velocity(speed):
	self.speed = speed
	self.speedSet = false
