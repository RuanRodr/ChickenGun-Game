class_name Window_Mode_Button extends Control

const WINDOW_MODE_ARRAY: Array[String] = [
	"Full Screen",
	"Window Mode",
	"Borderless Window",
	"Borderless Full Screen"
]

@onready var option_button: OptionButton = $HBoxContainer/OptionButton

func _ready() -> void:
	add_window_mode_items()
	
	option_button.item_selected.connect(on_window_mode_selected)

func _process(delta: float) -> void:
	pass

func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		option_button.add_item(window_mode)

func on_window_mode_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
			
