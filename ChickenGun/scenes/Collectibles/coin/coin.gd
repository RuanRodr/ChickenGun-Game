class_name Coin extends Area2D

static var collected_coins: int = 0

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		collected_coins += 1
		Signal_Manager.coin_collected.emit()
