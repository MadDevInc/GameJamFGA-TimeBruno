extends Node2D
var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	$Sprite2D.global_position.x -= speed * delta
	$Sprite2D2.global_position.x -= speed * delta
