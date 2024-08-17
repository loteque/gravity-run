extends Event
class_name AnnounceRaceStart

@export var wait_time: float
@export var ready_text: String
@export var set_text: String
@export var go_text: String
@export var announce_center_container: PackedScene

func execute():

    status = Status.BUSY

    var announce_container: Node = announce_center_container.instantiate()
    event_sequencer.add_child(announce_container)
    var announce_display = announce_container.announcement
    
    await event_sequencer.get_tree().create_timer(wait_time).timeout
    announce_display.text = ready_text
    await event_sequencer.get_tree().create_timer(wait_time).timeout
    announce_display.text = set_text
    await event_sequencer.get_tree().create_timer(wait_time).timeout
    announce_display.text = go_text
    await event_sequencer.get_tree().create_timer(wait_time + (wait_time * .5)).timeout
    announce_container.queue_free()

    status = Status.DONE
    done.emit()
    