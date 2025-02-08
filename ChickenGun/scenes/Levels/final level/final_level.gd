class_name Final_Level extends Level

var boss_life_max: int

@onready var teiu: Teiu = $Teiu
@onready var boss_fight: Label = $"UI/Boss Fight"
@onready var boss_slain: Label = $"UI/Boss Slain"
@onready var boss_life: ProgressBar = $"UI/Boss Life"
@onready var boss_name: Label = $"UI/Boss Name"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	boss_life_max = teiu.life
	teiu.player_detection.body_entered.connect(on_boss_fight_start)
	Signal_Manager.teiu_is_dead.connect(on_boss_slain)
	
func _process(delta: float) -> void:
	update_boss_life()
	
func on_boss_fight_start(body: Node2D) -> void:
	if body is Player and teiu.current_state is Idle_State:
		boss_fight.visible = true
		animation_player.play("boss fight")
		await animation_player.animation_finished
		boss_fight.visible = false
		
func on_boss_slain() -> void:
	boss_slain.visible = true
	animation_player.play("boss slain")
	await animation_player.animation_finished
	pass
	
func update_boss_life() -> void:
	boss_life.value = 100 * teiu.life / boss_life_max
