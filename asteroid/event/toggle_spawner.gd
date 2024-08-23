extends Event
class_name ToggleAsteroidSpawner


func execute():

    var spawner: Spawner = GameState.spawner_state[&"asteroid_spawner"]
    
    status = Status.BUSY

    if spawner.is_paused == false:
        
        spawner.is_paused = true
    
    else:
        
        spawner.is_paused = false

    status = Status.DONE
    done.emit()
    