extends Node

var is_paused: bool = false
var is_game_over: bool = false


func pause_stage():

    StageLoader.current_stage.get_tree().paused = true
    is_paused = true


func unpause_stage():
    
    StageLoader.current_stage.get_tree().paused = false
    is_paused = false


func end_stage(game_over: bool = true):
    
    if game_over:

        StageLoader.current_stage.get_tree().paused = true
        is_paused = true
        is_game_over = true


var campaign_completed: bool
var player_state: Dictionary = {}
var spawner_state: Dictionary = {}
signal player_state_added(player_state: PlayerState)