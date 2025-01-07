class_name Hotkey_Rebind_Button extends Control

@export var action_name: String 

@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button

func _ready() -> void:
	set_process_unhandled_key_input(false) 
	set_action_name()
	set_text_for_key()
	
func _process(delta: float) -> void:
	pass
	
func set_action_name() -> void:
	label.text = "Unassigned"
	
	match action_name:
		"move_left":
			label.text = "Move Left"
		"move_right":
			label.text = "Move Right"
		"jump":
			label.text = "Jump"
			
func set_text_for_key() -> void:
	var action_events: Array[InputEvent] = InputMap.action_get_events(action_name)
	var action_event: InputEvent = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode
	
func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		button.text = "..."
		set_process_unhandled_key_input(true)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.button_pressed = false
				i.set_process_unhandled_key_input(false)
	else:
		set_text_for_key()
		
		#for i in get_tree().get_nodes_in_group("hotkey_button"):
		#	if i.action_name != self.action_name:
		#		i.button.toggle_mode = true
		#		i.set_process_unhandled_key_input(false)
				
func rebind_action_key(event: InputEvent) -> void:
	set_process_unhandled_key_input(false)
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	set_text_for_key()
	#set_action_name()
	
func _unhandled_key_input(event: InputEvent) -> void:
	rebind_action_key(event)
	button.button_pressed = false
	
