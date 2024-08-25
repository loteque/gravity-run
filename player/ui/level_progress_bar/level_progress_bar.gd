extends ProgressBar


func _ready():
	
	GameState.player_state_added.connect(_on_player_state_added)

	%CurrentKills.text = "0"


func _on_player_state_added(player_state: PlayerState):
	
	max_value = player_state.kills_until_next_level
	%KillsNeeded.text = str(player_state.kills_until_next_level)

	player_state.kills_this_level_updated.connect(_on_kills_this_level_updated)
	player_state.kills_until_next_level_updated.connect(_on_kills_until_next_level_updated)
	player_state.level_updated.connect(_on_level_updated)


func _on_kills_this_level_updated(kill_count: int):
	
	value = kill_count
	%CurrentKills.text = str(kill_count)


func _on_kills_until_next_level_updated(kills_needed: int):
	
	max_value = kills_needed
	%KillsNeeded.text = str(kills_needed)


func _on_level_updated(level):
	
	%PlayerLevel.text = str(level)
