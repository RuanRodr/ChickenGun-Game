extends Node2D

const SPEED = 60
const SCORE = 100
var Enemy_Life = 2
var direction = 1

@onready var animated_sprite = $AnimatedSprite2D
@onready var shot_spawn_point: Marker2D = $ShotSpawnPoint
@onready var wall_detector: RayCast2D = $WallDetector
@onready var ground_detector: RayCast2D = $GroundDetector
@onready var player_detector: RayCast2D = $PlayerDetector
@onready var worm_bullet_scene = preload("res://scenes/Projectiles/bullet/bullet_worm.tscn")

enum EnemyState {PATROL, ATTACK, HURT}
var current_state = EnemyState.PATROL
@export var target : CharacterBody2D

func _ready():
	animated_sprite.frame_changed.connect(_on_animated_sprite_2d_frame_changed)

func _change_state(state) :
	current_state = state

func _physics_process(delta: float) -> void:
	match(current_state):
		EnemyState.PATROL : patrol_state(delta)
		EnemyState.ATTACK : attack_state()

func patrol_state(delta) :
	animated_sprite.play("run")
	if wall_detector.is_colliding() or not ground_detector.is_colliding():
		direction *= -1
		animated_sprite.scale.x *= -1
		wall_detector.scale.x *= -1
		player_detector.scale.x *= -1
		ground_detector.position.x *= -1
		shot_spawn_point.position.x *= -1
		
	if player_detector.is_colliding():
		_change_state(EnemyState.ATTACK)
	
	position.x += direction * SPEED * delta

func attack_state():
	animated_sprite.play("shooting")
	if not player_detector.is_colliding():
		_change_state(EnemyState.PATROL)

func hurt_state():
	implement_hit_flash() 
	await get_tree().create_timer(0.3).timeout
	_change_state(EnemyState.PATROL)
	if Enemy_Life >1:
		Enemy_Life -=1
	else: 
		kill()

func _on_hitbox_body_entered(body: Node2D) -> void:
	_change_state(EnemyState.HURT)
	hurt_state()

func kill():
	# Carrega a cena da explosão
	Player.score += SCORE
	var explosao_scene = preload("res://scenes/Effects/explosion/explosion.tscn")
	var explosao = explosao_scene.instantiate()
	
	# Posiciona a explosão no local do inimigo
	explosao.position = position
	
	# Adiciona a explosão à mesma cena que o inimigo
	get_parent().add_child(explosao)
	
	# Remove o inimigo
	queue_free() 

func implement_hit_flash() -> void:
	var tween = create_tween()
	tween.parallel().tween_property(self, "modulate", Color(1, 0, 0), 0.3)
	tween.chain().tween_property(self, "modulate", Color(1, 1, 1), 0.2)
	await tween.finished

func shot():
	var bullet = worm_bullet_scene.instantiate()  # Instancia a bala
	bullet.position = shot_spawn_point.global_position  # Posiciona a bala na posição do player

	# Calcula a direção da bala com base no flip_h
	bullet.bullet_velocity = Vector2(bullet.speed * direction, 0)  # Define a direção da bala

	get_parent().add_child(bullet)  # Adiciona a bala à cena

func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite.animation == "shooting":
		if animated_sprite.frame == 1:
			shot()
