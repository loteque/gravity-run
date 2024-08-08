extends Area2D
class_name Gravity


static var ZERO := Vector2.ZERO

var force := Gravity.ZERO
var grav_direction_vector := Gravity.ZERO


static func get_gravity_as_velocity(grav: float, grav_direction: Vector2):

    return grav_direction.normalized() * grav


static func get_gravity_direction_vector(area: Area2D, self_area: Area2D):
    
    return area.global_position - self_area.global_position


func _ready():
    
    add_to_group("Grav")
    area_entered.connect(_on_area_entered)
    area_exited.connect(_on_area_exited)


func _on_area_entered(area: Area2D):
    
    if area.is_in_group("Grav"):
        
        area.grav_direction_vector = Gravity.get_gravity_direction_vector(area, self)
        area.force = Gravity.get_gravity_as_velocity(self.gravity, area.grav_direction_vector)


func _on_area_exited(area: Area2D):
    
    if area.is_in_group("Grav"):
        
        area.force = Gravity.ZERO
