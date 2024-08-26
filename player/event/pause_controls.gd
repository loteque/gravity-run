extends Event
class_name ToggleControls


func execute():
    
    status = Status.BUSY

    for player_state_prop in GameState.player_state:

        if GameState.player_state[player_state_prop].input_paused == false:
        
            GameState.player_state[player_state_prop].input_paused = true

        else:

            GameState.player_state[player_state_prop].input_paused = false

    done.emit()
    status = Status.DONE
        