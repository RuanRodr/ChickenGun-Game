extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left= $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta

func _on_hitbox_body_entered(body: Node2D) -> void:
	# Carrega a cena da explosão
	var explosao_scene = preload("res://scenes/personagens/explosao.tscn")
	var explosao = explosao_scene.instantiate()
	
	# Posiciona a explosão no local do inimigo
	explosao.position = position
	
	# Adiciona a explosão à mesma cena que o inimigo
	get_parent().add_child(explosao)
	
	# Remove o inimigo
	queue_free()
