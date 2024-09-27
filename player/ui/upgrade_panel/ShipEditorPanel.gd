extends PanelContainer

@onready var card: PackedScene = preload("res://player/ui/upgrade_panel/cards/card.tscn")
@onready var card_tray: BoxContainer = %UpgradesRow
@onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")


func draw_3():

    for i in 3:

        var new_card = card.instantiate()
        card_tray.add_child(new_card)
        new_card.compile_card(UpgradeCard.get_random_card())



func _ready():
    
    GameState.player_state_added.connect(_on_player_state_added)
    %CloseButton.pressed.connect(_on_close_button_pressed)
    visibility_changed.connect(_on_visibility_changed)

    draw_3()


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

        draw_3()


@export var upgrade_points: Array[UpgradePointUI]
var valid_upgrade_point: UpgradePointUI

func find_valid_upgrade_point(data):

    for upgrade_point in upgrade_points:
        
        if !upgrade_point.visible:
            
            continue
        
        if upgrade_point.validate_upgrade_point(data):

            return upgrade_point

    return null

func _can_drop_data(_at_position, data):
    
    valid_upgrade_point = find_valid_upgrade_point(data)
    print("find_valid_upgrade_point(): ", valid_upgrade_point)

    var is_valid_part: bool = UpgradeData.Validator.validate(
         
        data[&"wing_type"],
        data[&"ship_section"], 
        data[&"id"]
    
    )

    var is_valid_point: bool
    if valid_upgrade_point: is_valid_point = true
    print("can_drop_data(): ", is_valid_point and is_valid_part)
    
    var is_valid_drop: bool = is_valid_point and is_valid_part
    if !is_valid_drop:
        
        anim_player.play(&"shake_ui_horizontal")

    return is_valid_drop


func _drop_data(_at_position, data):

    var new_value: int = valid_upgrade_point.value + data[&"return_value"]

    print("upgrading mount points")

    await valid_upgrade_point.upgrade_points(data[&"id"])
    valid_upgrade_point.value = new_value
    valid_upgrade_point.set_neighbor_values(valid_upgrade_point.value)

    owner.upgrade_applied.emit(data[&"wing_type"], data[&"id"])
    data[&"object"].tree_exiting.connect(_on_card_tree_exiting)
    data[&"object"].queue_free()


func _on_card_tree_exiting():

    var editor_panel = %ShipEditorPanel
    editor_panel.hide()
    GameState.unpause_stage() 

