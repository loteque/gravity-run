extends Node2D

@onready var standard: Node2D = %StandardIssue
@onready var medium_wing: Node2D = %MedWing
@onready var large_wing: Node2D = %LargeWing

enum UpgradeType {

    STA,
    MED,
    LAR

}

var type_name: Array = [

    &"standard",
    &"medium_wing",
    &"large_wing"
    
]

var upgrade_catalog: Dictionary = {
    type_name[UpgradeType.STA]: {},
    type_name[UpgradeType.MED]: {}, 
    type_name[UpgradeType.LAR]: {},
}


func compile_upgrade_catalog():

    for node in standard.get_children():

        var upgrade: Dictionary = {node.name: node}

        upgrade_catalog[type_name[UpgradeType.STA]].merge(upgrade)

    for node in medium_wing.get_children():

        var upgrade: Dictionary = {node.name: node}

        upgrade_catalog[type_name[UpgradeType.MED]].merge(upgrade)

    for node in large_wing.get_children():

        var upgrade: Dictionary = {node.name: node}

        upgrade_catalog[type_name[UpgradeType.LAR]].merge(upgrade)


func add_upgrade(wing_type, id):
    
    upgrade_catalog[wing_type][id].show()


func _ready():
    
    compile_upgrade_catalog()
    # print(upgrade_catalog)