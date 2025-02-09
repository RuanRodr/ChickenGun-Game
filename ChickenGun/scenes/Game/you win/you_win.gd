class_name You_Win extends CanvasLayer

@onready var restart_btn: Button = $Control/MarginContainer/HBoxContainer/VBoxContainer/restart_btn

func _kill():
	visible=true
	restart_btn.grab_focus()

func _on_restart_btn_pressed() -> void:
	visible = false
	get_tree().change_scene_to_file("res://scenes/menu/main_menu/main_menu.tscn")
	
func _on_quit_btn_pressed() -> void:
	get_tree().quit()
	
