extends Event
class_name Backdrop


@export var texture: Texture2D


func execute():
    event_sequencer.backdrop_display.texture = texture
    done.emit()