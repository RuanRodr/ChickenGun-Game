class_name You_Win extends CanvasLayer

@onready var quit_btn: Button = $Control/MarginContainer/HBoxContainer/VBoxContainer/quit_btn

func _kill():
	visible=true
	quit_btn.grab_focus()
	
func _on_quit_btn_pressed() -> void:
	get_tree().quit()
	
