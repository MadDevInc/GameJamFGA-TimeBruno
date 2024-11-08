extends Node2D

var left_limit = 160
var right_limit = 10000
var top_limit = -10000
var bottom_limit = 90

func _physics_process(delta):
	if $Pinto.global_position.y > 180:
		get_tree().reload_current_scene()
	$Camera2D.global_position = lerp($Camera2D.global_position, $Pinto.global_position, 1)
	if $Camera2D.global_position.x < left_limit:
		$Camera2D.global_position.x = left_limit
	if $Camera2D.global_position.x > right_limit:
		$Camera2D.global_position.x = right_limit
	if $Camera2D.global_position.y < top_limit:
		$Camera2D.global_position.y = top_limit
	if $Camera2D.global_position.y > bottom_limit:
		$Camera2D.global_position.y = bottom_limit

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Assets/Scenes/Levels/Bird/World/level_adult_bird.tscn")
