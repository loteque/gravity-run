extends TextureRect

@export var upgrade_type: int = 0
@export var cost: int = 1
@export var id: StringName = &"WingPortMed"
@export var wing_type: StringName = &"medium_wing"

func _get_drag_data(_at_position):
    
    print("dragged")
    
    var prev: TextureRect = self.duplicate()
    prev.z_index = 1

    var prev_area: Control = %DragDrop
    prev_area.set_drag_preview(prev)
    
    print(prev.size, prev.global_position, prev.z_index)
    return {&"type": upgrade_type, &"cost": cost, &"wing_type": wing_type, &"id": id, &"object": self,}