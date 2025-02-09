class_name Dead_State extends Teiu_State

const GRAVITY: float = 30.0

func enter(teiu: Teiu) -> void:
	super(teiu)
	Signal_Manager.teiu_is_dead.emit()
	teiu.animated_sprite_2d.play("idle")
	kill_teiu()
	
func physical_update(delta: float) -> void:
	teiu.velocity = Vector2(0.0, GRAVITY)
	teiu.move_and_slide()
	
func kill_teiu() -> void:
	teiu.collision_shape_2d.queue_free()
	teiu.player_detection.queue_free()
	teiu.hitbox.queue_free()
	teiu.killzone.queue_free()
	await teiu.get_tree().create_timer(3.0).timeout
	teiu.queue_free()
