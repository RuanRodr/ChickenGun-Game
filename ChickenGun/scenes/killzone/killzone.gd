class_name Killzone extends Area2D

const KNOCKBACK_INTENSITY: Vector2 = Vector2(25.0, 0.0) 

static var is_player_colliding: bool = false

var player: Player
var tween: Tween

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

#func _ready() -> void:
	#Signal_Manager.died.connect()

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_player_colliding:
		is_player_colliding = true
		player = body
		player.life -= 1
		if player.life == 0: 
			kill_player()
		else:
			tween = get_tree().create_tween()
			implement_knockback()
			implement_hit_flash()
			await tween.finished
			tween.kill()
		is_player_colliding = false
		
func implement_knockback() -> void:
	var knockback_direction: Vector2 = (player.global_position - self.global_position).normalized()
	var knockback: Vector2 = knockback_direction * KNOCKBACK_INTENSITY
	var player_position_after_knockback: Vector2 = player.global_position + knockback
	tween.parallel().tween_property(player, "global_position", player_position_after_knockback, 0.2)
	
func implement_hit_flash() -> void:
	tween.parallel().tween_property(player, "modulate", Color(1, 0.392, 0.392), 0.2)
	tween.chain().tween_property(player, "modulate", Color(1, 1, 1), 0.2)
	
func kill_player() -> void:
	Engine.time_scale = 0.5
	player.collision_shape_2d.queue_free() 
	await get_tree().create_timer(1.0).timeout
	Engine.time_scale = 1.0
	Signal_Manager.died.emit()
	
