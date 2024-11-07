extends Node2D
var enemy_scene = load("res://Assets/Scenes/Levels/Bird/Enemies/Enemie_bird.tscn")
var spawn_delay = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	pass # Replace with function body.
	var enemy_instance = enemy_scene.instantiate()
	self.add_child(enemy_instance)
	if spawn_delay >0.35:
		spawn_delay -= 0.01
	$Timer.start(spawn_delay)
