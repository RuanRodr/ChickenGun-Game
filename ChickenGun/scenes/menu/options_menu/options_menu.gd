class_name Options_Menu extends Control

@onready var quit_button: Button = $"MarginContainer/VBoxContainer/Quit Button"

signal quit_options_menu

func _ready() -> void:
	quit_button.button_down.connect(on_quit_pressed)
	set_process(false)

func _process(delta: float) -> void:
	pass
	
func on_quit_pressed() -> void:
	quit_options_menu.emit()
	set_process(false)
