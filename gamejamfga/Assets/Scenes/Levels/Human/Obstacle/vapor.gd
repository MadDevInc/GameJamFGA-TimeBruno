extends Area2D

@export var delay_to_start : float = 0

func _ready():
	initial_delay()

func initial_delay():
	await get_tree().create_timer(delay_to_start).timeout
	$Timer.start()

func _on_timer_timeout():
	$CPUParticles2D.emitting = !$CPUParticles2D.emitting
	if $CPUParticles2D.emitting:
		self.monitoring = true
	else:
		self.monitoring = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.kill()
