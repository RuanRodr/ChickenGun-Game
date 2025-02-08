class_name Follow_State extends Teiu_State

const SPEED_INTENSITY: float = 50.0

func enter(teiu: Teiu) -> void:
	super(teiu)
	teiu.animated_sprite_2d.play("idle") 
	print("Vc entrou no Follow State")
	
func physical_update(delta: float) -> void:
	super(delta)
	var speed_direction: Vector2 = -1 * distance_player.normalized()
	teiu.velocity = speed_direction * SPEED_INTENSITY
	teiu.move_and_slide()
	
func transition() -> Teiu_State:
	if abs(distance_player.x) < 30.0: return Melee_Attack.new()
	if teiu.life <= 990 and teiu.life > 980.0 : return Jump_State.new()
	if teiu.life == 0: return Dead_State.new()
	return null
