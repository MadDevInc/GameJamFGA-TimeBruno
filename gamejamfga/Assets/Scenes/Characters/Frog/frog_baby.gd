extends CharacterBody2D

const GRAVITY = -7.5
const TERMINAL_VELOCITY = -200

const SWIM_VELOCITY = 100.0
const SWIM_ACCEL = 7.5

var is_on_water = true

func set_on_water(value : bool):
	if value:
		is_on_water = true
	else:
		is_on_water = false

func _physics_process(delta: float) -> void:
	$Label.text = "velocity" + str(velocity)

	if global_position.y > 90:
		if Input.is_action_pressed("ui_down"):
			if velocity.y < SWIM_VELOCITY:
				velocity.y += SWIM_ACCEL
		else:
			if velocity.y > TERMINAL_VELOCITY:
				velocity.y += GRAVITY
	else:
		velocity.y -= GRAVITY

	move_and_slide()
