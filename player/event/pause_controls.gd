extends Event
class_name ToggleControls

@export var player: StringName


func execute():
    
    status = Status.BUSY

    if State.player_state[player].input_paused == false:
        
        State.player_state[player].input_paused = true

    else:

        State.player_state[player].input_paused = false

    done.emit()
    status = Status.DONE
        