extends Resource
class_name Event

@export var autostart: bool = false

var event_sequencer: EventSequencer
var status: int = Status.DONE
enum Status {
    DONE,
    BUSY
}


func execute():
    pass


signal done