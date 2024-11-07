extends CharacterBody2D

const GRAVITY = 980
const SPEED = 200.0
const JUMP_VELOCITY = -555.0

var direction = 1

var charge = 0
var charge_direction = 1

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
		direction = 1
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = true
		direction = -1

	if Input.is_action_pressed("ui_accept") and is_on_floor():
		if charge_direction == 1:
			if charge < 1:
				charge += 0.04
			else:
				charge_direction = -1
		elif charge_direction == -1:
			if charge > 0:
				charge -= 0.04
			else:
				charge_direction = 1

	if Input.is_action_just_released("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY * charge
		velocity.x = SPEED * direction * charge
		charge = 0

	if charge != 1.0:
		$AnimatedSprite2D.material.set_shader_parameter("height", charge)

	move_and_slide()
