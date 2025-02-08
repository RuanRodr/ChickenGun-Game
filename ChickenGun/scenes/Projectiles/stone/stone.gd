class_name Stone extends Area2D

const SPEED: float = 50.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var killzone: Killzone = $Killzone

func _process(delta: float) -> void:
	position.y += SPEED * delta
	if position.y > get_viewport_rect().size.y:
		set_process(false)
		queue_free()
