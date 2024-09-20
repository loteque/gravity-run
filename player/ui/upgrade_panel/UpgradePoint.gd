extends TextureRect

@export var point_type: int = 0
@export var point_value: int = 1

var type_match: bool
var point_match: bool

signal upgrade_applied(id)


func _can_drop_data(_at_position, data):
    
    if data[&"type"] == point_type:
        
        type_match = true

    else:

        print("wrong type for mount point")

    if data[&"cost"] <= point_value:

        point_match = true

    else:

        print("cost exceeds available mount points")

    if type_match and point_value:

        return true

    else:

        print("not the correct type")
        return false


func _drop_data(_at_position, data):

    upgrade_applied.emit(data[&"id"])
    data[&"object"].tree_exiting.connect(_on_card_tree_exiting)
    data[&"object"].queue_free()
    print(data)


func _on_card_tree_exiting():

    var editor_panel = %ShipEditorPanel
    editor_panel.hide()
    GameState.unpause_stage()
