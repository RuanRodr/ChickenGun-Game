class_name Goal extends Area2D

static var collected_goals: int = 0

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		collected_goals += 1 
		Signal_Manager.goal_collected.emit()
