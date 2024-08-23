extends Event
class_name AwaitPlayerLevel

@export var target_level: int


func execute():


    status = Status.BUSY
    print("await player level")
    
    GameState.player_state[&"player1"].level_updated.connect(_on_level_updated)


func _on_level_updated(level):
    
    if level == target_level:

        status = Status.DONE
        done.emit()

    
