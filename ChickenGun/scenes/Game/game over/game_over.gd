class_name Game_Over extends Control

@onready var restart_btn: Button = $MarginContainer/HBoxContainer/VBoxContainer/restart_btn
#@onready var hud: CanvasLayer = $"../HUD"

#func _ready():
	#visible= false
	
func _kill():
	visible=true
	#hud.visible = false
	#get_tree().paused = true
	restart_btn.grab_focus()

func _on_restart_btn_pressed() -> void:
	visible = false
	get_tree().change_scene_to_file("res://scenes/menu/main_menu/main_menu.tscn")
	
func _on_quit_btn_pressed() -> void:
	get_tree().quit()
	
