class_name Player extends CharacterBody2D

const SPEED = 110.0
const JUMP_VELOCITY = -250.0

static var life: int = 3
static var score: int = 0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var bullet_scene = preload("res://scenes/Projectiles/bullet/bullet.tscn")
@onready var muzzle = $Muzzle  # Referência ao nó Muzzle
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var timer: Timer = $Timer

const BULLETS = preload("res://scenes/Projectiles/bullet/bullet.tscn")

func _ready():
	life = 3
	score = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	#flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
		muzzle.position.x *= -1
	elif direction < 0:
		animated_sprite.flip_h = true
		muzzle.position.x *= -1
		
	#play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else: 
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	#applyy movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()  # Instancia a bala
	bullet.position = muzzle.global_position  # Posiciona a bala na posição do player

	# Calcula a direção da bala com base no flip_h
	var direction = -1 if animated_sprite.flip_h else 1  # -1 para esquerda, 1 para direita
	bullet.bullet_velocity = Vector2(bullet.speed * direction, 0)  # Define a direção da bala

	get_parent().add_child(bullet)  # Adiciona a bala à cena
