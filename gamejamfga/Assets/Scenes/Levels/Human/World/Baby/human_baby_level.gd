extends Node2D

var left_limit = 111
var right_limit = 1216

func _ready():
	if GLOBAL.baby_human_complete:
		$HumanBaby.global_position = Vector2(1208, -295)

func _physics_process(delta):
	if $HumanBaby.global_position.x >= 1209:
		GLOBAL.baby_human_complete = true
		get_tree().change_scene_to_file("res://Assets/Scenes/Levels/Human/World/Adult/human_adult_level.tscn")
	if $HumanBaby.global_position.x < 1056:
		$Camera2D.global_position = lerp($Camera2D.global_position, $HumanBaby.global_position, 0.01)
	else:
		$Camera2D.global_position.x = lerp($Camera2D.global_position.x, $HumanBaby.global_position.x, 1)
		if $Camera2D.global_position.x > right_limit:
			$Camera2D.global_position.x = right_limit
		$Camera2D.global_position.y = lerp($Camera2D.global_position.y, -368.0, 0.1)
