extends CharacterBody2D

signal interact

var gravity = 980

const SPEED = 55.0

var stunned = false

func stun():
	stunned = true

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta

	if !stunned:
		if Input.is_action_just_pressed("ui_accept"):
			emit_signal("interact")
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
