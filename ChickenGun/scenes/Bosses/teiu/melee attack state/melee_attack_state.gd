class_name Melee_Attack extends Teiu_State

func enter(teiu: Teiu) -> void:
	super(teiu)
	teiu.animated_sprite_2d.play("melee attack")
	print("Entrou em melee attack")
	
func physical_update(delta: float) -> void:
	super(delta)
	teiu.move_and_slide()
	
func transition() -> Teiu_State:
	if abs(distance_player.x) >= 30.0: return Follow_State.new()
	if teiu.life <= 990 and teiu.life > 980.0: return Jump_State.new()
	if teiu.life == 0.0: return Dead_State.new()
	return null
	
