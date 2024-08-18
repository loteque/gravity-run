extends Event
class_name Backdrop


@export var texture: Texture2D


func execute():
    
    status = Status.BUSY

    if !texture:
        
        event_sequencer.backdrop_display.texture = null
        done.emit()
        status = Status.DONE
        return
        
    event_sequencer.backdrop_display.texture = texture
    done.emit()