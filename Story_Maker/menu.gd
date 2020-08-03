extends Control


# Declare member variables here. Examples:

var prompts = ["vitor", "jurassic world", "greatest"]
var story = "%s -------------- %s --------------- %s"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("story story story blah blah blah")
	
	
	print(story % prompts)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("ui_up"):
	
	pass

func _on_LineEdit_text_entered(new_text):
	$VBoxContainer/Label.text = new_text
