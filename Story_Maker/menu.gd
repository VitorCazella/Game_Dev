extends Control


# Declare member variables here. Examples:
onready var displayedText = $VBoxContainer/Label
onready var editLine = $VBoxContainer/HBoxContainer/LineEdit

var played_words = []
var current_story = {
	"prompts": ["a name", "a noun", "an adverb", "an adjective"],
	"story": "Once upon a time someone called %s watched %s and he screamed %s. It was a %s day!"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	check_player_words_lenght()
	pass

func _on_TextureButton_pressed():
	add_to_played_words()

func add_to_played_words():
	played_words.append(editLine.text)
	displayedText.text = ""
	editLine.clear()
	check_player_words_lenght()

func is_story_done():
	return played_words.size() == current_story.prompts.size()

func check_player_words_lenght():
	if is_story_done():
		end_game()
	else:
		prompt_player() #ask user to type word

func end_game():
	editLine.queue_free()

func prompt_player():
	displayedText.text += "May I have " + current_story.prompts[played_words.size()] + " please?"

func _on_LineEdit_text_entered(new_text):
	updateDisplay(new_text)

func updateDisplay(text):
	if !(text == ""):
		displayedText.text = text
	editLine.clear()


