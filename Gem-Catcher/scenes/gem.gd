extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 100.0 * delta
	
	#as soon as the gem gets to the bottom of the viewport DISSAPPEAR
	if position.y > get_viewport_rect().size.y:
		set_process(false)
		queue_free()
