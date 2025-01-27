extends AnimatedSprite2D

func _ready():
	# Reproduz a animação 'explosion' (substitua pelo nome correto da animação)
	play("explosao")  

func _on_AnimatedSprite2D_animation_finished():
	queue_free()  # Remove o objeto após a animação terminar
