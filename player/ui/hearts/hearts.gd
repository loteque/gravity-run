extends HBoxContainer


func _ready():
	
	GameState.player_state_added.connect(_on_player_state_added)


func _on_player_state_added(player_state):

	player_state.health_updated.connect(_on_health_updated)


func _on_health_updated(health):

	match health:
		
		2:
			get_node("TextureRect3").hide()
			return

		1:
			get_node("TextureRect2").hide()
			return

		0:
			get_node("TextureRect").hide()

		_:
			return