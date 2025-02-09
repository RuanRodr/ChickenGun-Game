class_name Enemy extends CharacterBody2D
	
var position_factor: float = 0.0
var speed_factor: float = PI / 50  
var travel_range_factor: float = 100
var life: int

func _physics_process(delta: float) -> void:
	position_factor += speed_factor  
	velocity.x = travel_range_factor * cos(position_factor) 
