extends Node2D


@export var gem_scene: PackedScene

@onready var label: Label = $Label


var _score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_gem()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func spawn_gem():
	var new_gem: Gem = gem_scene.instantiate()
	var xpos: float = randf_range(70, 1050)
	new_gem.on_gem_off_screen.connect(game_over)
	new_gem.position = Vector2(xpos, -50)
	add_child(new_gem)
	
func game_over():
	print("game_over")



func _on_timer_timeout():
	print("on_timer_timeout")
	spawn_gem()


func _on_paddle_area_entered(area):
	_score += 1
	label.text = "%05d" % _score
	area.queue_free()
	
