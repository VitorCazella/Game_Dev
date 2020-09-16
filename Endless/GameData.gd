extends Node2D

export (String, FILE) var enemy
onready var enemy_scene = load(enemy)

onready var label = $HUD/Control/Label
onready var spawn = $Spawner/Position2D

var screen_size
var score = 0
export var numberOfAsteriods = 1

const min_speed = 50
const speed_range = 100

func _ready():
	screen_size = get_viewport().size
	for i in range(numberOfAsteriods):
		spawn_asteroids(int(screen_size.x), int(screen_size.y))
	pass

func _process(delta):
	label.text = ("Score: " + String(score))

func _on_block_despawn():
	# Spawn a raindrop on the top line at a random horizontal position.
	spawn_asteroids(int(screen_size.x), int(screen_size.y))
	pass

func spawn_asteroids(range_x, range_y):
	var asteroid = enemy_scene.instance()
	asteroid.position = Vector2(randi() % range_x, randi() % range_y)
	# Connect the despawn signal
	asteroid.connect("despawn", self, "_on_block_despawn")
	get_node("Spawner/Position2D").add_child(asteroid)
