extends CharacterBody2D

const GRAVITY = 980
const JUMP_FORCE = -250
const SPEED = 75.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 980 * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
