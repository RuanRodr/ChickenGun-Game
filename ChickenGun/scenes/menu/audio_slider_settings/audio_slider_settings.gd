extends Control

@onready var audio_name_lbl: Label = $HBoxContainer/Audio_Name_Lbl
@onready var audio_number_lbl: Label = $HBoxContainer/Audio_Number_Lbl
@onready var h_slider: HSlider = $HBoxContainer/HSlider

@export_enum("Master", "Music", "Sfx") var bus_name: String

var bus_index: int = 0

func _ready() -> void:
	h_slider.value_changed.connect(on_value_changed)
	
	get_bus_index_by_name()
	set_audio_name_lbl()
	set_slider_value()
	set_audio_number_lbl()
	
func _process(delta: float) -> void:
	pass
	
func set_audio_number_lbl() -> void:
	audio_number_lbl.text = str(h_slider.value * 100) + "%"
	
func on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	
	set_audio_number_lbl()
	
func get_bus_index_by_name() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
func set_audio_name_lbl() -> void:
	audio_name_lbl.text = bus_name + " Volume"
	
func set_slider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
