class_name Jump_State extends Teiu_State

const GRAVITY: float = 200.0
const JUMP_TIME: float = 2.0

var jump_direction: float 
var distance_j: float 
var speed_jump_x: float
var speed_jump_y: float 
var is_jumping: bool = false

func enter(teiu: Teiu) -> void:
	super(teiu)
	teiu.animated_sprite_2d.play("tailed")
	await teiu.animated_sprite_2d.animation_finished
	teiu.animated_sprite_2d.play("idle")
	set_distance()
	set_speed_jump_x()
	set_speed_jump_y()
	teiu.velocity = Vector2(speed_jump_x, speed_jump_y)
	
func physical_update(delta: float) -> void:
	#super(delta)
	if not teiu.is_on_floor(): is_jumping = true
	teiu.velocity.y += GRAVITY * delta
	teiu.move_and_slide()
	
func transition() -> Teiu_State:
	if teiu.is_on_floor() and is_jumping: return Stone_Attack_State.new()
	return null 
	
func set_distance() -> void:
	distance_j = abs(teiu.global_position.x - teiu.spawn_global_position.x)
	
func set_speed_jump_x() -> void:
	speed_jump_x = distance_j / JUMP_TIME
	
func set_speed_jump_y() -> void:
	speed_jump_y = -GRAVITY * JUMP_TIME
