extends CharacterBody2D

# Variáveis para controlar a física do pulo e da queda
@export var gravity = 700.0
@export var jump_strength = -200.0
var dead = false
var game_started = false


	
func _physics_process(delta):
	
	if not game_started:
		if Input.is_action_just_pressed("ui_accept"):
			
			var layer1 = get_parent().get_node("layer1_old_bird")
			layer1.speed = 20
			var layer2 = get_parent().get_node("layer_2_bird")
			layer2.speed = 50
			var layer3 = get_parent().get_node("layer_3_bird")
			layer3.speed = 100
			
			get_parent().get_node("Timer").start(1)
			game_started = true

		 # Começa o jogo ao pressionar "ui_accept"
		return 	
	# Aplica a gravidade ao personagem
	velocity.y += gravity * delta
	
	# Detecta o pulo ao pressionar a tecla de ação "ui_accept" (geralmente a barra de espaço)
	if Input.is_action_just_pressed("ui_accept") and dead == false:
		velocity.y = jump_strength  # Aplica a força de pulo
		$AnimatedSprite2D.play("flapy_old")
	
	# Move o personagem no eixo Y
	move_and_slide()
	
	
func kill():
	#get_tree().reload_current_scene()
	var layer1 = get_parent().get_node("layer1_old_bird")
	layer1.speed = 0
	var layer2 = get_parent().get_node("layer_2_bird")
	layer2.speed = 0
	var layer3 = get_parent().get_node("layer_3_bird")
	layer3.speed = 0
	
	dead = true
	
	await get_tree().create_timer(4).timeout
	get_tree().reload_current_scene()
