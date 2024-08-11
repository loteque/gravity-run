extends Resource
class_name GameState

static var is_paused: bool = false
static var is_game_over: bool = false


static func pause_stage():

    StageLoader.current_stage.get_tree().paused = true
    is_paused = true


static func unpause_stage():
    
    StageLoader.current_stage.get_tree().paused = false
    is_paused = false


static func end_stage(game_over: bool = true):
    
    if game_over:

        StageLoader.current_stage.get_tree().paused = true
        is_paused = true
        is_game_over = true
