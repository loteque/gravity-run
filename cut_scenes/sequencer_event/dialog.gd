extends Event
class_name Dialog


@export var text: String
@export var character: Character


func set_display_portrait():

    if !character: return;

    if !character.portrait: return;

    if event_sequencer.dialog_display.portrait != character.portrait:
    
        event_sequencer.dialog_display.portrait = character.portrait    


func set_display_name():

    if !character: return;

    if !character.display_name: return;

    if event_sequencer.dialog_display.name_display.text != character.display_name:

        event_sequencer.dialog_display.char_name = character.display_name
    

func execute():
    
    status = Status.BUSY
    set_display_name()
    set_display_portrait()
    event_sequencer.dialog_display.dialog = text
    status = Status.DONE
    done.emit()