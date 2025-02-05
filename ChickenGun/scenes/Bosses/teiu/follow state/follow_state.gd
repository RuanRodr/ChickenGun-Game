class_name Follow_State extends Teiu_State

const SPEED_INTENSITY: float = 400.0

var distance: Vector2

func enter(teiu: Teiu) -> void:
	super(teiu)
	teiu.animated_sprite_2d.play("idle") # depois mudar para follow
	print("Vc entrou no Follow State")
	
func physical_update(delta: float) -> void:
	distance = teiu.player.global_position - teiu.global_position
	var speed_direction = distance.normalized()
	distance = Vector2(abs(distance.x), abs(distance.y))
	teiu.velocity = speed_direction * SPEED_INTENSITY
	
func transition() -> Teiu_State:
	if distance.x < 500.0: return Melee_Attack.new()
	return null
