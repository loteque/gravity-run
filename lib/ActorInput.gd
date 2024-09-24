extends Node
class_name ActorInput

enum MovementVector {
	
	UP = 0,
	RIGHT = 1,
	DOWN = 2,
	LEFT = 3,
	UP_20 = 10,
	UP_MINUS_20 = 11,
	RIGHT_20 = 20,
	RIGHT_MINUS_20 = 21,
	DOWN_20 = 31,
	DOWN_MINUS_20 = 32,
	LEFT_20 = 40,
	LEFT_MINUS_20 = 41

}


static func deg_to_screen_vec(deg: float) -> Vector2:

    return Vector2(cos(deg_to_rad(deg)), -sin(deg_to_rad(deg)))


static var movement_vector: Dictionary = {

    MovementVector.UP: deg_to_screen_vec(90),
    MovementVector.RIGHT: deg_to_screen_vec(360),
    MovementVector.DOWN: deg_to_screen_vec(270),
    MovementVector.LEFT: deg_to_screen_vec(180),
    MovementVector.UP_20: deg_to_screen_vec(70),
    MovementVector.UP_MINUS_20: deg_to_screen_vec(110),
    MovementVector.RIGHT_20: deg_to_screen_vec(20),
    MovementVector.RIGHT_MINUS_20: deg_to_screen_vec(340),
    MovementVector.DOWN_20: deg_to_screen_vec(250),
    MovementVector.DOWN_MINUS_20: deg_to_screen_vec(290),
    MovementVector.LEFT_20: deg_to_screen_vec(160),
    MovementVector.LEFT_MINUS_20: deg_to_screen_vec(200),

}


func get_vector_from_inputs():
    
    return Input.get_vector("left", "right", "up", "down")


func get_vector_to_left():
    
    return movement_vector[MovementVector.LEFT]


func get_vector_to_right():

    return movement_vector[MovementVector.RIGHT]