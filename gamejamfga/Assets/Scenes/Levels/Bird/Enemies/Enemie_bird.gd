extends Area2D
var speed = 75
var min_position = 7
var max_position = 173

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	randomize()
	self.global_position.x = 326
	self.global_position.y = randf_range(min_position, max_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("ui_accept"):
		#get_tree().reload_current_scene()
	pass
	self.global_position.x -= speed*delta


func _on_body_entered(body):
	pass # Replace with function body.
	body.kill()
