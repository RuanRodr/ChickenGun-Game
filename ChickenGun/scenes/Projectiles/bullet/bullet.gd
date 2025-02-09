class_name Bullet extends CharacterBody2D

var speed: float = 200.0  # Velocidade base da bala
var bullet_velocity: Vector2 = Vector2.ZERO  # Direção da bala

func _ready():
	# Aplica a direção configurada pelo player
	velocity = bullet_velocity

func _physics_process(delta: float) -> void:
	# Movimenta a bala
	move_and_slide()

func _on_timer_timeout() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
