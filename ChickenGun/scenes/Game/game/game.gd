class_name Game extends Node

const LEVEL_1_PATH: String = "res://scenes/Levels/Level 1/level_1.tscn"
const LEVEL_2_PATH: String = "res://scenes/Levels/Level 2/level_2.tscn"
const LEVEL_3_PATH: String = "res://scenes/Levels/Level 3/level_3.tscn"
const FINAL_LEVEL_PATH: String = "res://scenes/Levels/Final Level/final_level.tscn"

const levels_paths: PackedStringArray = [LEVEL_1_PATH, LEVEL_2_PATH, LEVEL_3_PATH, FINAL_LEVEL_PATH]

const TRANSITION = preload("res://scenes/Game/transition/transition.tscn")
const GAME_OVER = preload("res://scenes/Game/game over/game_over.tscn")
const YOU_WIN = preload("res://scenes/Game/you win/you_win.tscn")
const PAUSE = preload("res://scenes/Game/pause/pause.tscn")

var current_level_number: int = 0

@onready var current_level: Node = $"Current Level"
@onready var player: Player = $Player
@onready var hud: HUD = $HUD

func _ready() -> void:
	Signal_Manager.player_fell.connect(on_player_fell)
	Signal_Manager.died.connect(on_died)
	Signal_Manager.goal_collected.connect(on_goal_collected)
	Signal_Manager.you_win.connect(on_you_win)
	load_and_add_level() 
	position_player_at_current_level()
	
func on_player_fell() -> void:
	position_player_at_current_level()
	
func on_died() -> void:
	var game_over: Game_Over = GAME_OVER.instantiate()
	add_child(game_over)
	player.queue_free()
	hud.queue_free()
	game_over._kill()
	
func on_goal_collected() -> void:
	var transition: Transition
	get_tree().paused = true
	transition = TRANSITION.instantiate()
	add_child(transition)
	transition.play_transition()
	await transition.scene_transition.finished
	current_level.get_child(0).queue_free()
	current_level_number += 1 
	load_and_add_level() 
	transition.play_transition_reverse()
	await transition.scene_transition.finished
	transition.queue_free()
	get_tree().paused = false 
	position_player_at_current_level()

func load_and_add_level() -> void:
	var level_path: String = levels_paths[current_level_number]
	var level_scene: PackedScene = load(level_path)
	current_level.add_child(level_scene.instantiate())

func position_player_at_current_level() -> void:
	player.global_position = current_level.get_child(0).get_node("Player Spawn").global_position
	print(player.global_position)
	print(current_level.get_child(0).get_node("Player Spawn").global_position)
	
func on_you_win() -> void:
	var you_win: You_Win = YOU_WIN.instantiate()
	get_tree().paused = true
	add_child(you_win)
	hud.queue_free()
	you_win._kill()
	
