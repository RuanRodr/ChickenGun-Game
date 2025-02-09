class_name Teiu_State extends Node

var teiu: Teiu
var percentage_life: float: get = get_percentage_life
var distance_player: Vector2

func enter(teiu: Teiu) -> void:
	self.teiu = teiu
	
func update(delta: float) -> void:
	pass

func physical_update(delta: float) -> void:
	distance_player = teiu.global_position - teiu.player.global_position
	if distance_player.x < 0.0: teiu.animated_sprite_2d.flip_h = true
	if distance_player.x > 0.0: teiu.animated_sprite_2d.flip_h = false

func transition() -> Teiu_State:
	return null
	
func on_hitbox_entered(body: Node2D) -> void:
	pass
	
func get_percentage_life() -> float:
	return 100.0 * teiu.life / teiu.MAX_LIFE
