extends Node
class_name EventSequencer
#plugin name: DEP; DEP is not a Dialog Editor Plugin


@export var dialog_box: PackedScene
@export var characters: Array[Character]
@export var sequence: Array[Event]




var current_event_idx: int = 0:
    set(value):
        
        if value >= sequence.size(): 
            
            status = Status.DONE

        current_event_idx = value


signal done()
var status = Status.OK
enum Status {
    OK = 0,
    INPUT_PAUSED = 1,
    DONE = 2,
    ERROR = 10,
}


func execute_event(event_idx: int):
        
        if _check_seq_done(): return

        status = Status.INPUT_PAUSED
        
        var event: Event = sequence[event_idx]
        event.done.connect(_on_event_done)
        
        event.execute()
        
        var next_event_idx = event_idx + 1
        current_event_idx = next_event_idx

        if _check_seq_done(): return
        
        var next_event = sequence[next_event_idx]
        if next_event.autostart:
            
            if event.status == Event.Status.BUSY:
                await event.done
                
            execute_event(next_event_idx)


func _check_seq_done():

    if status == Status.DONE: return true


func _on_event_done():

    if _check_seq_done(): return

    status = Status.OK        
    
    if sequence[current_event_idx].done.is_connected(_on_event_done):
        
        sequence[current_event_idx].done.disconnect(_on_event_done)


func _unhandled_input(event):
    
    if !(event is InputEventKey):
        
        return

    if status == Status.INPUT_PAUSED:
        
        return

    # refactor hardcoded keycode to use event_input
    if event.pressed and event.keycode == KEY_SPACE:
        
        if status == Status.DONE:

            done.emit()
            return

        execute_event(current_event_idx)


var dialog_display: DialogBox
@onready var backdrop_display: TextureRect = TextureRect.new()
@onready var wait_timer: Timer = Timer.new()
func _ready():
    
    add_child(wait_timer)
    add_child(backdrop_display)
    dialog_display = dialog_box.instantiate()
    add_child(dialog_display)

    for event in sequence:
        
        event.event_sequencer = self        

    if sequence.is_empty():

        status = Status.INPUT_PAUSED
        return
    
    if sequence[current_event_idx].autostart:

        execute_event(current_event_idx)