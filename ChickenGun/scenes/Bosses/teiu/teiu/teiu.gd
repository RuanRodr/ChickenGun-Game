class_name Teiu extends CharacterBody2D

const GRAVITY: float = 300.0

var current_state: Teiu_State
var player: Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player_detection: Area2D = $"Player Detection"

func _ready() -> void:
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
	move_and_slide()
