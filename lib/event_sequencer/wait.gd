extends Event
class_name Wait

@export var wait_time_secs: float


var wait_timer: Timer
func execute():
    
    wait_timer = event_sequencer.wait_timer
    wait_timer.one_shot = true
    wait_timer.timeout.connect(_on_timeout)
    wait_timer.start(wait_time_secs)


func _on_timeout():

    done.emit()
    wait_timer.timeout.disconnect(_on_timeout)