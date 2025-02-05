class_name Melee_Attack extends Teiu_State

var distance: Vector2

func enter(teiu: Teiu) -> void:
	super(teiu)
	teiu.animated_sprite_2d.play("melee attack")
	print("Entrou em melee attack")
	
func physical_update(delta: float) -> void:
	distance = teiu.player.global_position - teiu.global_position
	distance = Vector2(abs(distance.x), abs(distance.y))
	
func transition() -> Teiu_State:
	print(distance.x)
	if distance.x >= 100.0: return Follow_State.new()
	return null
