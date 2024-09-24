extends PanelContainer

@onready var card: PackedScene = preload("res://player/ui/upgrade_panel/cards/card.tscn")
@onready var card_tray: BoxContainer = %UpgradesRow

func _ready():
    
    GameState.player_state_added.connect(_on_player_state_added)
    %CloseButton.pressed.connect(_on_close_button_pressed)
    visibility_changed.connect(_on_visibility_changed)

    for i in 3:

        var new_card = card.instantiate()
        card_tray.add_child(new_card)


func _on_player_state_added(player_state):

    player_state.level_updated.connect(_on_level_updated)


func _on_level_updated(_level):
    
    GameState.pause_stage()
    await get_tree().create_timer(1.4).timeout
    show()


func _on_close_button_pressed():
    
    print("pressed close button")
    GameState.unpause_stage()
    hide()

func _on_visibility_changed():

    if visible:

        for child in card_tray.get_children():
            
            child.free()

        for i in 3:

            var new_card = card.instantiate()
            card_tray.add_child(new_card)