class_name Credits extends Control

@onready var quit_button: Button = $"MarginContainer/VBoxContainer/Quit Button"

signal quit_credits

func _ready() -> void:
	quit_button.button_down.connect(on_quit_pressed)
	set_process(false)

func _process(delta: float) -> void:
	pass

func on_quit_pressed() -> void:
	quit_credits.emit()
	set_process(false)
