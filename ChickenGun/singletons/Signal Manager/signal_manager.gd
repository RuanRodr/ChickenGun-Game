extends Node

# Todos os signals customizados (criados pelos desenvolvedores) 
# são declarados nesse Singleton. Todas as classes que utilizam
# esses signals podem acessar Signal_Manager a partir de qualquer ponto 
# do projeto. O reuso de código se torna mais fácil, e é mais rápido
# encontrar a assinatura de um signal qualquer. Por motivos de 
# de eficiencia Signal_Manager é a classe variável glonal do projeto.

# Signal_Manager.nome_do_signal.emit() lança o sinal
# Signal_Manager.nome_do_signal.connect(nome_da_funcao) conecta uma função em um signal

signal coin_collected
signal goal_collected
signal died
signal on_hit_player
signal player_fell
signal stone_off_screen
signal teiu_is_dead
signal you_win
