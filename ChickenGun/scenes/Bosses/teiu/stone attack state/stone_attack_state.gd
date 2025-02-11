class_name Stone_Attack_State extends Teiu_State

const LOWER_LIMIT_X: float = 0.0
const UPPER_LIMIT_X: float = 500.0
const LOWER_LIMIT_Y: float = -50.0

const STONE = preload("res://scenes/Projectiles/stone/stone.tscn")

var stone_spawner: Node = Node.new()
var timer: Timer = Timer.new()

func enter(teiu: Teiu) -> void:
	super(teiu)
	teiu.animated_sprite_2d.play("idle")
	timer.autostart = true
	timer.one_shot = false
	timer.wait_time = 0.5
	timer.timeout.connect(spawn_stones)
	teiu.add_child(timer)
	stone_spawner.name = "Stone Spawner"
	teiu.add_child(stone_spawner)
	spawn_stones()
	
func transition() -> Teiu_State:
	if percentage_life > 75.0 and percentage_life <= 100.0: return Follow_State.new()
	if percentage_life > 25.0 and percentage_life <= 50.0: return Follow_State.new()
	if teiu.life == 0.0: return Dead_State.new()
	return null

func spawn_stones() -> void:
	var stone: Stone = STONE.instantiate()
	var stone_position_x: float = randf_range(LOWER_LIMIT_X, UPPER_LIMIT_X)
	stone.position = Vector2(stone_position_x, LOWER_LIMIT_Y)
	teiu.get_node("Stone Spawner").add_child(stone)
