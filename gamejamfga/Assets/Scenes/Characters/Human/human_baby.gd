extends CharacterBody2D

const WALK_SPEED = 25.0
const CRAWL_SPEED = 65.0

var is_crawling = false

func _physics_process(delta: float) -> void:
#implementa o crouch
	if Input.is_action_pressed("ui_accept"):
		is_crawling = true
		if $AnimatedSprite2D.animation == "stand":
			$AnimatedSprite2D.play("crouch")
	else:
		is_crawling = false
		if $AnimatedSprite2D.animation == "crouch":
			$AnimatedSprite2D.play("stand")

#movimentação do jogador
	if Input.is_action_pressed("ui_right"):
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

	move_and_slide()
