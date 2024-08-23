extends HBoxContainer


func _ready():
	
	GameState.player_state_changed.connect(_on_player_state_changed)


func _on_player_state_changed(state):

	state.health_updated.connect(_on_health_updated)


func _on_health_updated(health):

	if health == 3:
		get_node("TextureRect3").hide()
		return

	if health == 2:
		get_node("TextureRect2").hide()
		return

	if health == 1:
		get_node("TextureRect").hide()

	if health <= 0:
		return