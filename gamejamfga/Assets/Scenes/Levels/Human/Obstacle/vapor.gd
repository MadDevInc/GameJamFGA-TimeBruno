extends Area2D

func _on_timer_timeout():
	$CPUParticles2D.emitting = !$CPUParticles2D.emitting
	if $CPUParticles2D.emitting:
		self.monitoring = true
	else:
		self.monitoring = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.kill()
