extends Node
class_name Movement

@export var actor: Node2D
@export var speed: float

func has_actor():
    
    if actor: return true


func get_input():
    
    return Input.get_vector("left", "right", "up", "down")



func update_actor():
    
    var input_direction = get_input()
    actor.velocity = input_direction * speed
    actor.move_and_slide()


func _physics_process(_delta):
    
    if !has_actor():
        return

    update_actor()