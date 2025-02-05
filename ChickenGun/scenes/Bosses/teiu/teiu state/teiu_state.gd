class_name Teiu_State extends Node

var teiu: Teiu

func enter(teiu: Teiu) -> void:
	self.teiu = teiu
	
func update(delta: float) -> void:
	pass

func physical_update(delta: float) -> void:
	pass

func transition() -> Teiu_State:
	return null
