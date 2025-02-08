extends Control

@onready var resume_btn: Button = $MarginContainer/HBoxContainer/VBoxContainer/resume_btn
#@onready var hud: CanvasLayer = $"res://scenes/menu/hud/hud.tscn"
@onready var menu_bnt: Button = $MarginContainer/HBoxContainer/VBoxContainer/menu_bnt
@onready var quit_btn: Button = $MarginContainer/HBoxContainer/VBoxContainer/quit_btn

func _ready():
	resume_btn.pressed.connect(_on_resume_btn_pressed)
	visible= false

func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		visible=true
		#hud.visible= false
		get_tree().paused = true
		resume_btn.grab_focus()

func _on_resume_btn_pressed() -> void:
	visible= false
	#hud.visible= true
	get_tree().paused = false
	
func _on_menu_bnt_pressed() -> void:

	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Menu/main_menu/main_menu.tscn")
	
func _on_quit_btn_pressed() -> void:
	get_tree().quit()
	
