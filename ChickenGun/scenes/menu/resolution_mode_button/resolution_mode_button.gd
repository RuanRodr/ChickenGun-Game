extends Control

const RESOLUTION_DICTIONARY: Dictionary = {
	"1152 x 648": Vector2i(1152, 648),
	"1280 x 720": Vector2i(1280, 720),
	"1920 x 1080": Vector2i(1920, 1080)
}

@onready var option_button: OptionButton = $HBoxContainer/OptionButton

func _ready() -> void:
	add_resolution_mode_items()
	
	option_button.item_selected.connect(on_resolution_selected)

func _process(delta: float) -> void:
	pass
	
func add_resolution_mode_items() -> void:
	for resolution_mode_key in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_mode_key)
		
func on_resolution_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
