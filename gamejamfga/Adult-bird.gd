extends CharacterBody2D

# Variáveis para controlar a física do pulo e da queda
@export var gravity = 700.0
@export var jump_strength = -200.0

func _physics_process(delta):
	# Aplica a gravidade ao personagem
	velocity.y += gravity * delta
	
	# Detecta o pulo ao pressionar a tecla de ação "ui_accept" (geralmente a barra de espaço)
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_strength  # Aplica a força de pulo
		$AnimatedSprite2D.play("flapy")

	# Move o personagem no eixo Y
	move_and_slide()
	
func kill():
	get_tree().reload_current_scene()
