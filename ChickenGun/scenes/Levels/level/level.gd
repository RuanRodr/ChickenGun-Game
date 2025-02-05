class_name Level extends Node2D

@onready var lower_limit: Area2D = $"Lower Limit"

func _ready() -> void:
	lower_limit.body_entered.connect(on_lower_limit_body_entered)
	
func on_lower_limit_body_entered(body: Node2D) -> void:
	if body is Player:
		body.life += -1
		Signal_Manager.player_fell.emit()
		Signal_Manager.died.emit()
	
