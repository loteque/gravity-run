extends Event
class_name PlayAnimation

@export var animation_packed: PackedScene

func execute():

    status = Status.BUSY

    var animation = animation_packed.instantiate()

    event_sequencer.add_child(animation)
    
    animation.play()
    await animation.animation_finished
    
    status = Status.DONE
    done.emit()