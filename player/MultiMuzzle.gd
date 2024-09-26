extends Muzzle
class_name MultiMuzzle

@export var succession: bool = true
@export var connected_weapons: Array[ShipUpgrade]

var is_empty: bool

var is_live: bool = false

func set_is_live():

    for weapon in connected_weapons:

        if weapon.get_child(0).is_empty:

            continue

        else:
            
            weapon.get_child(0).is_live = true
            print("is_live set on: ", weapon, is_live)
            break


func shoot(): 
    
    if !is_empty and is_live:
        
        is_empty = true
        is_live = false
        get_parent().visible = false
        super.shoot()

    set_is_live()


func _ready():

    is_live = false
    set_is_live()

    get_parent().visibility_changed.connect(_on_parent_visibility_changed)


func _on_parent_visibility_changed():

    if get_parent().visible:

        is_empty = false

    else:

        is_empty = true


func _unhandled_input(event):

    if !(event is InputEventKey):
        
        return

    if player_state.input_paused:

        return

    if !is_active:

        return

    handle_shoot_event(event)


