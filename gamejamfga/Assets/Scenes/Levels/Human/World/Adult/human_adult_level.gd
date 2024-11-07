extends Node2D

@export var left_limit = 8
@export var right_limit = 10000

func _physics_process(delta):
	if $HumanAdult.global_position.x >= 1449:
		get_tree().change_scene_to_file("res://Assets/Scenes/Levels/Human/World/Old/human_old_level.tscn")
	if $HumanAdult.global_position.x <= 100:
		$Camera2D.global_position.x = lerp($Camera2D.global_position.x, $HumanAdult.global_position.x, 1)
	else:
		$Camera2D.global_position.x = lerp($Camera2D.global_position.x, $HumanAdult.global_position.x, 0.1)
	if $Camera2D.global_position.x < left_limit:
		$Camera2D.global_position.x = left_limit
	if $Camera2D.global_position.x > right_limit:
		$Camera2D.global_position.x = right_limit

	if $HumanAdult.global_position.x >= 1330:
		$Camera2D.global_position.x = lerp($Camera2D.global_position.x, $HumanAdult.global_position.x, 1)
