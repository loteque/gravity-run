extends Event
class_name ToggleControls

@export var player: StringName


func execute():
    
    status = Status.BUSY

    if GameState.player_state[player].input_paused == false:
        
        GameState.player_state[player].input_paused = true

    else:

        GameState.player_state[player].input_paused = false

    done.emit()
    status = Status.DONE
        