class_name Enemy extends CharacterBody2D
	
var position_factor: float = 0.0

var life: int

@export var speed_factor: float = PI / 50  
@export var travel_range_factor: float = 100

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var hit_box_collision_shape_2d: CollisionShape2D = $HitBox/CollisionShape2D
@onready var killzone_collision_shape_2d: CollisionShape2D = $Killzone/CollisionShape2D

func _ready() -> void:
	hit_box_collision_shape_2d = collision_shape_2d.duplicate()
	killzone_collision_shape_2d = collision_shape_2d.duplicate()

func _physics_process(delta: float) -> void:
	position_factor += speed_factor  
	velocity.x = travel_range_factor * cos(position_factor) 
	if (sin(position_factor) == -1): animated_sprite.flip_h = false
	if (sin(position_factor) == +1): animated_sprite.flip_h = true
	
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
