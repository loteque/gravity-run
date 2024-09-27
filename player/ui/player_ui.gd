extends CanvasLayer

@export var upgrades: Node2D

@onready var lazer_info: Control = %Lazer
@onready var torpedo_info: Control = %Torpedo
@onready var bomb_info: Control = %SmallBomb

signal upgrade_applied(wing_type, id)


func _ready():

    upgrade_applied.connect(_on_upgrade_applied)


var lazer_slot_vid: Array[int] = [

    UpgradeData.Validator.ValidPartName.LAZER_BOW,
    UpgradeData.Validator.ValidPartName.LAZER_STARBOARD,
    UpgradeData.Validator.ValidPartName.LAZER_STERN, 
    UpgradeData.Validator.ValidPartName.LAZER_PORT,

]

var torpedo_slot_vid: Array[int] = [

    UpgradeData.Validator.ValidPartName.TORPEDO_STARBOARD,
    UpgradeData.Validator.ValidPartName.TORPEDO_PORT,

]

var bomb_slot_vid: Array[int] = [
    
    UpgradeData.Validator.ValidPartName.LAUNCH_TUBE_STARTBOARD_SMALL,
    UpgradeData.Validator.ValidPartName.LAUNCH_TUBE_SMALL,
    UpgradeData.Validator.ValidPartName.LAUNCH_TUBE_PORT_SMALL,

]

func _on_upgrade_applied(wing_type, id):

    upgrades.add_upgrade(wing_type, id)
    print("added upgrade, id: ", id)

    match id:

        var int_id when lazer_slot_vid.has(int_id):

            lazer_info.show()

        var int_id when torpedo_slot_vid.has(int_id):

            torpedo_info.show()

        var int_id when bomb_slot_vid.has(int_id):

            bomb_info.show()

        _:      
            
            return