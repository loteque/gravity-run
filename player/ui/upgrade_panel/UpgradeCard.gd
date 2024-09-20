extends TextureRect

@export var upgrade_type: int = 0
@export var cost: int = 1
@export var id: StringName = &"Wing"


func _get_drag_data(_at_position):
    
    print("dragged")
    
    var prev: TextureRect = self.duplicate()
    prev.z_index = 1

    var prev_area: Control = %DragDrop
    prev_area.set_drag_preview(prev)
    
    print(prev.size, prev.global_position, prev.z_index)
    return {&"type": upgrade_type, &"cost": cost, &"id": id, &"object": self,}