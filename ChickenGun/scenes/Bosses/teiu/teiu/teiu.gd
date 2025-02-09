class_name Teiu extends CharacterBody2D

const MAX_LIFE: int = 100

var life: int = MAX_LIFE
var current_state: Teiu_State
var player: Player
var buff: float = 1.0
var spawn_global_position: Vector2

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player_detection: Area2D = $"Player Detection"
@onready var hitbox: Area2D = $Hitbox
@onready var killzone: Killzone = $Killzone

func _ready() -> void:
	spawn_global_position = global_position
	hitbox.body_entered.connect(on_hitbox_entered)
	current_state = Idle_State.new()
	current_state.enter(self)
	
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var state: Teiu_State
	current_state.physical_update(delta)
	state = current_state.transition()
	if state != null:
		current_state.queue_free()
		current_state = state
		current_state.enter(self)
	
func on_hitbox_entered(body: Node2D) -> void:
	print("Vc entrou")
	if body is not Bullet: return
	body.queue_free()
	if current_state is not Idle_State: life -= 1
	print(life)
		
