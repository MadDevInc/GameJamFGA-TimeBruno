extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.set_climbing(true)
		print("aw ra pra ter ido")

func _on_body_exited(body):
	if body.is_in_group("player"):
		body.set_climbing(false)
