extends Node2D

onready var timer = get_node("Timer")
onready var label = get_node("Camera2D/Label")
onready var window = $PopupMenu
onready var score = $PopupMenu/Score

var enemiesDefeated = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var timeLeft = "%.1f" % timer.time_left
	label.text = ("Time left: " + timeLeft)
	pass

func _on_Timer_timeout():
	window.popup()
	score.text = "Score\n" + String(enemiesDefeated)
	pass # Replace with function body.

