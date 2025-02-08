class_name Jare extends Enemy

func _process(delta: float) -> void:
	pass 

func _physics_process(delta: float) -> void:
	super(delta)
	move_and_slide()
