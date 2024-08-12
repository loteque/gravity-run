extends Movement

@export var min_speed: float


func calculate_speed_max(player_level):

	return floor(player_level * 5 + speed)


func set_rand_speed(player_level):

	if player_level < 3: return

	speed = randf_range(
		min_speed, 
		calculate_speed_max(
			player_level
		)
	)


func _ready():

	set_rand_speed(State.player_state["player1"].level)

