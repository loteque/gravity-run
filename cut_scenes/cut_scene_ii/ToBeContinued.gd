extends CanvasLayer

@export var event_sequencer: EventSequencer

func _ready():
    
    event_sequencer.done.connect(_on_sequence_done)

func _on_sequence_done():
    
    show()
    State.campaign_completed = true
    await get_tree().create_timer(3).timeout
    StageLoader.load_new_stage(1)