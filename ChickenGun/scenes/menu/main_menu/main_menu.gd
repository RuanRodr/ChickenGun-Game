extends Control

const GAME = preload("res://scenes/Game/game/game.tscn")

@onready var margin_container: MarginContainer = $MarginContainer
@onready var start_button = $"MarginContainer/HBoxContainer/VBoxContainer/start_button"
@onready var options_button = $"MarginContainer/HBoxContainer/VBoxContainer/options_button"
@onready var credits_button = $"MarginContainer/HBoxContainer/VBoxContainer/credits_button"
@onready var quit_button = $"MarginContainer/HBoxContainer/VBoxContainer/quit_button"
@onready var options_menu: Options_Menu = $"Options Menu"
@onready var credits: Credits = $Credits

func _ready() -> void:
	options_menu.visible = false
	credits.visible = false
	handle_connecting_signals()
	
func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	credits_button.button_down.connect(on_credits_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	options_menu.quit_options_menu.connect(on_quit_options_menu)
	credits.quit_credits.connect(on_quit_credits)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)
	print("start")
	
func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.visible = true
	options_menu.set_process(true)
	
func on_credits_pressed() -> void:
	margin_container.visible = false
	credits.visible = true
	credits.set_process(true)
	
func on_quit_pressed() -> void:
	get_tree().quit()
	
func on_quit_options_menu() -> void:
	options_menu.visible = false
	margin_container.visible = true
	
func on_quit_credits() -> void:
	credits.visible = false
	margin_container.visible = true
