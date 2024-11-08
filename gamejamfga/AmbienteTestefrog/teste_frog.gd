extends Node2D

@export var bottom_limit = -82
@export var top_limit = 10000


func _physics_process(delta):
	#print($Camera2D.global_position.y)
	#print($FrogAdult.global_position)
	
	$Camera2D.global_position.y = lerp($Camera2D.global_position.y, $FrogAdult.global_position.y, 0.15)
	if $Camera2D.global_position.y > bottom_limit:
		$Camera2D.global_position.y = bottom_limit
	if $Camera2D.global_position.y > top_limit:
		$Camera2D.global_position.y = top_limit

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Assets/Scenes/Levels/Frog/old_frog.tscn")
