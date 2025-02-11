class_name HUD extends CanvasLayer

@onready var life_counter: Label = $Control/container/life_container/life_counter
@onready var corns_counter: Label = $Control/container/corn_container/corns_counter
@onready var score_counter: Label = $Control/container/score_container/score_counter


func _ready() -> void:
	corns_counter.text = (str)("%04d" % Coin.collected_coins)
	score_counter.text = (str)("%06d" % Player.score)
	life_counter.text = (str)(Player.life)

func _process(_delta) -> void:
	corns_counter.text = (str)("%04d" % Coin.collected_coins)
	score_counter.text = (str)("%06d" % Player.score)
	life_counter.text = (str)(Player.life)
	
	
