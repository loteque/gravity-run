extends Node
class_name ActorInput

func get_vector_from_inputs():
    
    return Input.get_vector("left", "right", "up", "down")


func get_vector_to_left():
    
    return Vector2(-1, 0)


func get_vector_to_right():

    return Vector2(1, 0)