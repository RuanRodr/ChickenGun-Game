class_name Dead_State extends Teiu_State

func enter(teiu: Teiu) -> void:
	Signal_Manager.teiu_is_dead.emit()
