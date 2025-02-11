class_name Transition extends CanvasLayer

const STARTING_THRESHOLD: float = 0.0
const END_THRESHOLD: float = 1.0
const DURATION: float = 1.0

var scene_transition: Tween 

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.material.set("shader_parameter/threshold", STARTING_THRESHOLD)

func play_transition() -> void:
	scene_transition = get_tree().create_tween()	
	
	scene_transition.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	
	scene_transition.tween_property(
		color_rect.material, 
		"shader_parameter/threshold", 
		END_THRESHOLD, 
		DURATION)	

func play_transition_reverse() -> void:
	scene_transition = get_tree().create_tween()	
	
	scene_transition.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	
	scene_transition.tween_property(
		color_rect.material,
		"shader_parameter/threshold",
		STARTING_THRESHOLD,
		DURATION
	)
