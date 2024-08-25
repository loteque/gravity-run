extends Node
class_name PlayerState

@export var hurtbox: HurtBox

var id: StringName = "player1"
var kills_until_next_level: int = 1
var kills_this_level: int = 0
var level: int = 0
var total_kills: int = 0
var health: int
var input_paused: bool
# TODO: These properties belong to asteroid or asteroid_spawner
var spawn_rate: float
var asteriod_velocity: float

var next_level_kills_modifier: Callable = func(next_level) -> int:
    return next_level
    # return floor((kills_until_next_level / 10.0) * next_level)


signal asteroid_killed
signal kills_until_next_level_updated(kills_until_next_level)
signal kills_this_level_updated(kills_this_level)
signal level_updated(level)
signal total_kills_updated(total_kills)
signal health_updated(health)

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

    health = hurtbox.health

    asteroid_killed.connect(_on_asteroid_killed)
    var player_state:Dictionary = {id: self,}
    GameState.player_state.merge(player_state)
    GameState.player_state_added.emit(GameState.player_state[id])

    tree_exiting.connect(_on_tree_exiting)


func _on_asteroid_killed():
	
    count_kill(1)

    if kills_this_level >= kills_until_next_level:
        
        level_up()


func _on_tree_exiting():
    
    GameState.player_state.erase(id)