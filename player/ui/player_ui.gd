extends CanvasLayer

@export var upgrades: Node2D

signal upgrade_applied(wing_type, id)


func _ready():

    upgrade_applied.connect(_on_upgrade_applied)


func _on_upgrade_applied(wing_type, id):

    upgrades.add_upgrade(wing_type, id)
    print("added upgrade, id: ", id)