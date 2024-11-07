extends CharacterBody2D

const GRAVITY = -7.5
const TERMINAL_VELOCITY = -200
var game_started = false
var dead = false

const SWIM_VELOCITY = 100.0
const SWIM_ACCEL = 7.5

var is_on_water = true

func set_on_water(value : bool):
	if value:
		is_on_water = true
	else:
		is_on_water = false
func _ready():
	get_parent().get_node("Timer").start(1)
	game_started = true
	
func _physics_process(delta: float) -> void:
	

	if global_position.y > 90 and dead == false:
		if Input.is_action_pressed("ui_accept"):
			if velocity.y < SWIM_VELOCITY:
				velocity.y += SWIM_ACCEL
		else:
			if velocity.y > TERMINAL_VELOCITY:
				velocity.y += GRAVITY
	else:
		velocity.y -= GRAVITY

	move_and_slide()
	
func kill():
	#get_tree().reload_current_scene()
	#var layer1 = get_parent().get_node("Layer1_Adult_Bird")
	#layer1.speed = 0
	#var layer2 = get_parent().get_node("layer_2_bird")
	#layer2.speed = 0
	#var layer3 = get_parent().get_node("layer_3_bird")
	#layer3.speed = 0
	
	dead = true
	
	await get_tree().create_timer(4).timeout
	get_tree().reload_current_scene()


