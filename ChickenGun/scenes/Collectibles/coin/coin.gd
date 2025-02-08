class_name Coin extends Area2D

static var collected_coins: int = 0

@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		collected_coins += 1
		pickup_sound.autoplay = true
		Signal_Manager.coin_collected.emit()
		queue_free()
