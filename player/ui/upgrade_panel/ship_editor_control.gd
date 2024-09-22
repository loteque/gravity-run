extends Control

@export var stern_2: Array[TextureRect]
@export var stern_1: Array[TextureRect]
@export var bow: Array[TextureRect]
@export var port_wing_top: Array[TextureRect]
@export var port_wing_drones: Array[TextureRect]
@export var port_wing_leading: Array[TextureRect]
@export var port_fuselage: Array[TextureRect]
@export var star_wing_top: Array[TextureRect]
@export var star_wing_drones: Array[TextureRect]
@export var star_wing_leading: Array[TextureRect]
@export var star_fuselage: Array[TextureRect]


func show_points(points: Array):

    for point in points:

        point.show()
        await get_tree().create_timer(0.5).timeout
    
    await get_tree().create_timer(1).timeout


@onready var port_wing_upgrade_1: Array = [

    port_wing_top[1],
    port_wing_leading[0],
    port_wing_drones[1]

]

@onready var port_wing_upgrade_2: Array = [

    port_wing_top[0],
    port_wing_leading[1],
    port_wing_leading[2],
    port_wing_drones[0]

]

@onready var star_wing_upgrade_1: Array = [

    star_wing_top[1],
    star_wing_leading[0],
    star_wing_drones[1]

]

@onready var star_wing_upgrade_2: Array = [

    star_wing_top[0],
    star_wing_leading[1],
    star_wing_leading[2],
    star_wing_drones[0]

]

@onready var stern_upgrade: Array = [

    stern_2[0],
    stern_2[1],
    stern_2[2]

]

@onready var bow_upgrade: Array = [

    bow[1],
    bow[2]

]

@onready var port_fuselage_upgrade: Array = [

    port_fuselage[0]

]

@onready var star_fuselage_upgrade: Array = [

    star_fuselage[1]

]