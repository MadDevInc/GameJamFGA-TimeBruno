extends CharacterBody2D

var GRAVITY = 400
const JUMP_FORCE = -150
const SPEED = 75.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	print(GRAVITY)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
	if Input.is_action_pressed("ui_accept") and velocity.y > 0:
		$AnimatedSprite2D.play("jump")
		velocity.x = 0
		GRAVITY = 10
	else:
		GRAVITY = 400

	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
		velocity.x = -SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = 0

	move_and_slide()
