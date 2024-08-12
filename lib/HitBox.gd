extends Area2D
class_name HitBox

@export var damage: int

func _ready():
    add_to_group("Hitbox")