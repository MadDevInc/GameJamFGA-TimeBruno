extends Node2D
var enemy_scene = load("res://Assets/Scenes/Levels/Bird/Enemies/Enemie_bird.tscn")
var spawn_delay = 1.0

func  _ready():
	initial_timer()

func initial_timer():
	await get_tree().create_timer(45).timeout
	$Timer.stop()
	await get_tree().create_timer(10).timeout
	$AnimationPlayer.play("transition")


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

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "transition":
		get_tree().change_scene_to_file("res://Assets/Scenes/Levels/Frog/World/Level_Baby_Frog.tscn")
