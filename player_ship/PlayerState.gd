extends Node
class_name PlayerState

var id: String
var spawn_rate: float
var asteriod_velocity: float
var kills_until_next_level: int = 1
var kills_this_level: int = 0
var level: int = 0
var total_kills: int = 0


var next_level_kills_modifier: Callable = func(next_level) -> int:
	return next_level
	# return floor((kills_until_next_level / 10.0) * next_level)


signal asteroid_killed
signal kills_until_next_level_updated(kills_until_next_level)
signal kills_this_level_updated(kills_this_level)
signal level_updated(level)
signal total_kills_updated(total_kills)


func count_kill(count):
	
	total_kills += count
	total_kills_updated.emit(total_kills)

	kills_this_level += count
	kills_this_level_updated.emit(kills_this_level)


func level_up():

	level += 1
	level_updated.emit(level)
	
	kills_this_level = 0
	kills_this_level_updated.emit(kills_this_level)

	kills_until_next_level = next_level_kills_modifier.call(level)
	kills_until_next_level_updated.emit(kills_until_next_level)


func _ready():

	asteroid_killed.connect(_on_asteroid_killed)
	State.player_state["player1"] = self
	State.player_state_changed.emit(State.player_state["player1"])


func _on_asteroid_killed():
	
	count_kill(1)

	if kills_this_level >= kills_until_next_level:
		
		level_up()
