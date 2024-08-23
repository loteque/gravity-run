extends ProgressBar


func _ready():
	
	GameState.player_state_changed.connect(_on_player_state_changed)

	%CurrentKills.text = "0"


func _on_player_state_changed(state: PlayerState):
	
	max_value = state.kills_until_next_level
	%KillsNeeded.text = str(state.kills_until_next_level)

	state.kills_this_level_updated.connect(_on_kills_this_level_updated)
	state.kills_until_next_level_updated.connect(_on_kills_until_next_level_updated)
	state.level_updated.connect(_on_level_updated)


func _on_kills_this_level_updated(kill_count: int):
	
	value = kill_count
	%CurrentKills.text = str(kill_count)


func _on_kills_until_next_level_updated(kills_needed: int):
	
	max_value = kills_needed
	%KillsNeeded.text = str(kills_needed)


func _on_level_updated(level):
	
	%PlayerLevel.text = str(level)
