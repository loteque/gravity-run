extends Sprite2D
class_name ShipUpgrade

var is_active: bool:
    set(b):
        for muzzle in get_children():
            muzzle.is_active = b

func _ready():
    
    visibility_changed.connect(_on_visibility_changed)

func _on_visibility_changed():

    if visible:

        is_active = true
    
    else:
    
        is_active = false
