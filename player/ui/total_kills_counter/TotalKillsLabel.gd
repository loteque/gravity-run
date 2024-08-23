extends Label

@onready var player_state: PlayerState = get_tree().get_first_node_in_group("Player").get_node("PlayerState")

func _ready():
	print(player_state.name)
	player_state.ready.connect(_on_player_state_ready)


func _on_player_state_ready():
	player_state.total_kills_updated.connect(_on_total_kills_updated)


func _on_total_kills_updated(total_kills: int):
	text = str(total_kills)
