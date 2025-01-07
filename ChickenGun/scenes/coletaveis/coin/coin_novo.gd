extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	print("entrou")
	

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	animation_player.play("pickup")
	print("ol")
