extends Area2D
class_name Gravity


static var ZERO := Vector2.ZERO


static func get_gravity_direction_vector(area: Area2D, self_area: Area2D):
    
    return (area.global_position - self_area.global_position).normalized()


static func get_gravity_as_velocity(grav: float, area: Gravity, self_area: Area2D):

    return get_gravity_direction_vector(area, self_area) * grav


static func get_inverse_gravity_as_velocity(area, self_area):
    
    return get_gravity_as_velocity(self_area.gravity, area, self_area) * -1


static func reset_force(area):

    area.force = Gravity.ZERO


static func apply_force(area, self_area):

    area.force = area.force + get_gravity_as_velocity(self_area.gravity, area, self_area)


static func apply_inverse_force(area, self_area):

    area.force = (area.force + get_inverse_gravity_as_velocity(area, self_area)) * -1


static func invert(area):

    area.gravity = area.gravity * -1


var force := Gravity.ZERO


func _ready():
    
    add_to_group("Grav")
    area_exited.connect(_on_area_exited)
    area_entered.connect(_on_area_entered)

func update():

    if !monitoring:
        
        return

    for overlap_area in get_overlapping_areas():
        
        if !overlap_area.is_in_group("Grav"): 
            
            continue
        
        Gravity.apply_force(overlap_area, self)


func _on_area_exited(area: Area2D):
    
    if area.is_in_group("Grav"):
        
        Gravity.reset_force(area)

    if area.is_in_group("BlackHole"):

        Gravity.invert(area)


func _on_area_entered(area: Area2D):

    if self.is_in_group("BlackHole"):

        Gravity.invert(area)


func _physics_process(_delta):
    
    update()