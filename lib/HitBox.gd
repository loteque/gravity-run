extends Area2D
class_name HitBox

@export var damage: int

var owner_id: StringName

func _ready():
    
    add_to_group("Hitbox")