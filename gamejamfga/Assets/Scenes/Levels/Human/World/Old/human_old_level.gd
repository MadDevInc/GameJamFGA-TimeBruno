extends Node2D

var left_limit = 111
var right_limit = 160

var is_in_elevator = false

func _physics_process(delta):
	$Camera2D.global_position.x = lerp($Camera2D.global_position.x, $HumanElder.global_position.x, 1)
	if $Camera2D.global_position.x > 160:
		$Camera2D.global_position.x = 160

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		is_in_elevator = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		is_in_elevator = false

func _on_human_elder_interact():
	if is_in_elevator:
		$HumanElder.stun()
		$AnimationPlayer.play("ascend")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "ascend":
		get_tree().change_scene_to_file("res://Assets/Scenes/Levels/Bird/World/level_baby_bird.tscn")
		
