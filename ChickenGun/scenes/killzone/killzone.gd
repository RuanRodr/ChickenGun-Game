class_name Killzone extends Area2D

const KNOCKBACK_INTENSITY: Vector2 = Vector2(25.0, 0.0) 

static var is_player_invulnerable: bool = false

var player: Player
var tween: Tween

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body
		if not is_player_invulnerable: player.life -= 1
		if player.life == 0: 
			kill_player()
		else:
			tween = get_tree().create_tween()
			implement_flash()
			await tween.finished
			is_player_invulnerable = false
			tween.kill()
		
func implement_flash() -> void:
	is_player_invulnerable = true
	tween.tween_property(player, "modulate", Color(1, 0.392, 0.392), 0.2)
	for i in range(0,3): 
		tween.chain().tween_property(player, "modulate", Color(1, 1, 1), 0.2)
		tween.chain().tween_property(player, "modulate", Color(1, 0.392, 0.392), 0.2)
	tween.chain().tween_property(player, "modulate", Color(1, 1, 1), 0.2)
	
func kill_player() -> void:
	Engine.time_scale = 0.5
	player.collision_shape_2d.queue_free() 
	await get_tree().create_timer(1.0).timeout
	Engine.time_scale = 1.0
	Signal_Manager.died.emit()

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		pass
		

		
