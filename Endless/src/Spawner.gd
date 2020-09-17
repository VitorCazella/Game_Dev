extends Node2D

export (String, FILE) var enemy
onready var enemy_scene = load(enemy)

onready var spawn = $Position2D

var screen_size
export var numberOfAsteriods = 1
var entries = 0

func _ready():
	screen_size = get_viewport().size
	for i in range(numberOfAsteriods):
		entries += 1
		spawn_asteroids(int(screen_size.x), int(screen_size.y))
	print(entries)
	pass

func _process(delta):
	pass

func _on_block_despawn():
	# Spawn a raindrop on the top line at a random horizontal position.
	print("despawn")
	spawn_asteroids(int(screen_size.x), int(screen_size.y))
	pass

func spawn_asteroids(range_x, range_y):
	var asteroid = enemy_scene.instance()
	asteroid.position = Vector2(randi() % range_x, randi() % range_y)
	# Connect the despawn signal
	asteroid.connect("despawn", self, "_on_block_despawn")
	get_node("Position2D").add_child(asteroid)
