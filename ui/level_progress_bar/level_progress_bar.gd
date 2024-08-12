extends ProgressBar

@onready var player_state: PlayerState = get_tree().get_first_node_in_group("Player").get_node("PlayerState")

func _ready():
	
	%CurrentKills.text = "0"
	
	player_state.ready.connect(_on_player_state_ready)
	
	max_value = player_state.kills_until_next_level
	%KillsNeeded.text = str(max_value)


func _on_player_state_ready():
	
	player_state.kills_this_level_updated.connect(_on_kills_this_level_updated)
	player_state.kills_until_next_level_updated.connect(_on_kills_until_next_level_updated)


func _on_kills_this_level_updated(kill_count: int):
	
	value = kill_count
	%CurrentKills.text = str(value)

func _on_kills_until_next_level_updated(kills_needed: int):
	
	max_value = kills_needed
	%KillsNeeded.text = str(max_value)
