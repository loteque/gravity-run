extends Node2D

@onready var standard: Node2D = %StandardIssue
@onready var medium_wing: Node2D = %MedWing
@onready var large_wing: Node2D = %LargeWing


var upgrade_catalog: Dictionary = {
    &"standard": {},
    &"medium_wing": {}, 
    &"large_wing": {}, 
}



func compile_upgrade_catalog():

    for node in standard.get_children():

        var upgrade: Dictionary = {node.name: node}

        upgrade_catalog[&"standard"].merge(upgrade)

    for node in medium_wing.get_children():

        var upgrade: Dictionary = {node.name: node}

        upgrade_catalog[&"medium_wing"].merge(upgrade)

    for node in large_wing.get_children():

        var upgrade: Dictionary = {node.name: node}

        upgrade_catalog[&"large_wing"].merge(upgrade)


func add_upgrade(wing_type, id):
    
    upgrade_catalog[wing_type][id].show()


func _ready():
    
    compile_upgrade_catalog()
    print(upgrade_catalog)