extends Event
class_name AwaitPlayerLevel

@export var target_level: int

const PLAYER: StringName = &"player1" 

func execute():


    status = Status.BUSY
    print("await player level")
    
    GameState.player_state[PLAYER].level_updated.connect(_on_level_updated)


func _on_level_updated(level):
    
    if level == target_level:

        status = Status.DONE
        done.emit()

    
