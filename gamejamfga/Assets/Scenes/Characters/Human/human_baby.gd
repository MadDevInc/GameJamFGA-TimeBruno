extends CharacterBody2D

const WALK_SPEED = 25.0
const CRAWL_SPEED = 65.0
const CLIMB_SPEED = -35.0

var gravity = 980

var is_crawling = false

var is_climbing = false

func set_climbing(value : bool):
	if value:
		is_climbing = true
	else:
		is_climbing = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 980 * delta
#implementa o crouch
	if Input.is_action_pressed("ui_accept"):
		$CollisionShape2D.set_deferred("disabled", true)
		$CollisionShape2D2.set_deferred("disabled", false)
		is_crawling = true
		if $AnimatedSprite2D.animation == "stand":
			$AnimatedSprite2D.play("crouch")
	else:
		$CollisionShape2D.set_deferred("disabled", false)
		$CollisionShape2D2.set_deferred("disabled", true)
		is_crawling = false
		if $AnimatedSprite2D.animation == "crouch":
			$AnimatedSprite2D.play("stand")

#movimentação do jogador
	if Input.is_action_pressed("ui_right") and is_climbing and is_crawling:
		velocity.y = CLIMB_SPEED
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("crawl")
		if is_crawling:
			$AnimatedSprite2D.play("crawl")
			velocity.x = CRAWL_SPEED
		else:
			$AnimatedSprite2D.play("walk")
			velocity.x = WALK_SPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = true
		if is_crawling:
			$AnimatedSprite2D.play("crawl")
			velocity.x = -CRAWL_SPEED
		else:
			$AnimatedSprite2D.play("walk")
			velocity.x = -WALK_SPEED
	else:
		if !is_crawling:
			$AnimatedSprite2D.play("stand")
		else:
			$AnimatedSprite2D.play("crouch")
		velocity.x = 0
		#velocity.y = 0

	if is_climbing and is_crawling:
		$AnimatedSprite2D.play("climb")

	move_and_slide()

func kill():
	get_tree().reload_current_scene()
