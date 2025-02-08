class_name Idle_State extends Teiu_State

var player_entered: bool = false

func enter(teiu: Teiu) -> void:
	super(teiu)
	teiu.animated_sprite_2d.play("idle")
	teiu.player_detection.body_entered.connect(on_body_entered)
	print("Entrou no Idle")
	
func physical_update(delta: float) -> void:
	pass
	
func transition() -> Teiu_State:
	if player_entered: return Follow_State.new()
	return null
	
func on_body_entered(body: Node2D) -> void:
	if body is Player: 
		teiu.player = body
		player_entered = true

		
