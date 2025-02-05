class_name Jare extends Enemy

const SPEED = 60

var direction = 1

var x: float = 0.1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left= $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

#func _process(delta: float) -> void:
	##if ray_cast_right.is_colliding():
		##direction = -1
		##animated_sprite.flip_h = false
		##
	##if ray_cast_left.is_colliding():
		##direction = 1
		##animated_sprite.flip_h = true
	##
	##position.x += direction * SPEED * delta
	##
	#
	#position.x = sin(x) * 50 
	#
	#if sin(x) == -1: animated_sprite.flip_h = true
	#if sin(x) == +1: animated_sprite.flip_h = false
	#
	#x += (PI / 2) / 60.0 
	#
	#print(x)
	#
	#if (x >= 2 * PI): 
		#x = 0.0
		#
#
	#
	#
	#
	#
	#pass 

func _on_hitbox_body_entered(body: Node2D) -> void:
	# Carrega a cena da explosão
	var explosao_scene = preload("res://scenes/Effects/explosion/explosion.tscn")
	var explosao = explosao_scene.instantiate()
	
	# Posiciona a explosão no local do inimigo
	explosao.position = position
	
	# Adiciona a explosão à mesma cena que o inimigo
	get_parent().add_child(explosao)
	
	# Remove o inimigo
	queue_free()
	
func _physics_process(delta: float) -> void:
	super(delta)
	if (sin(position_factor) == -1): animated_sprite.flip_h = true
	if (sin(position_factor) == +1): animated_sprite.flip_h = false
	move_and_slide()
