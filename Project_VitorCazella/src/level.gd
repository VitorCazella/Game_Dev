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
	
	if Input.is_action_just_pressed("ui_cancel"):
		window.popup()
		#timer.pause_mode
	pass

func _physics_process(delta):
	var timeLeft = "%.1f" % timer.time_left
	label.text = ("Time left: " + timeLeft)
	pass

func _on_MenuButton_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.

func _on_PopupMenu_popup_hide():
	timer.paused(false)
	pass # Replace with function body.


func _on_Timer_timeout():
	window.popup()
	timer.paused(true)
	score.text = "Score\n" + String(enemiesDefeated)
	pass # Replace with function body.


func _on_exitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.
