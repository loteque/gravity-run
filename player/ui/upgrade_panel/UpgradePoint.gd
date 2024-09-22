extends TextureRect

@export var type: int = 0
@export var value_max: int = 3
@export var value: int = 1:
    set(value):
        set_neighbor_values(value)

@onready var editor_control: Control = %ShipEditorControl


func set_neighbor_values(new_value):
        for point in get_parent().get_children():
            
            if point == self:
            
                continue

            await point.ready
            point.value = new_value
            print("set value on: ", self.name, value)


var type_match: bool = false
var point_match: bool = false

func _can_drop_data(_at_position, data):
    
    if data[&"type"] == type:
        
        type_match = true

    else:

        print("wrong type for mount point")

    if data[&"cost"] <= value:

        point_match = true

    else:

        print("cost exceeds available mount points")

    if type_match and value:

        return true

    else:

        print("not the correct type")
        return false


func _drop_data(_at_position, data):

    var new_value: int = value + data[&"return_value"]

    if !type_match or !value:
        
        return

    if new_value <= value_max:

        upgrade_points(data[&"id"])
        value = new_value


    owner.upgrade_applied.emit(data[&"wing_type"], data[&"id"])
    data[&"object"].tree_exiting.connect(_on_card_tree_exiting)
    data[&"object"].queue_free()


func _on_card_tree_exiting():

    var editor_panel = %ShipEditorPanel
    editor_panel.hide()
    GameState.unpause_stage() 


func upgrade_points(id):
    print("upgraded points on: ", id)
    match id:
        &"WingPortMed":
            await editor_control.show_points(
                editor_control.port_wing_upgrade_1
            )
        
        &"WingStarboardMed":
            await editor_control.show_points(
                editor_control.star_wing_upgrade_1
            )
        
        &"CannonPort":
            editor_control.show_points(
                editor_control.port_fuselage_upgrade
            )

        &"CannonStarboard":
            editor_control.show_points(
                editor_control.star_fuselage_upgrade
            )

        _:
            return