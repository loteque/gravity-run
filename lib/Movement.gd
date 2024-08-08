extends Node
class_name Movement

@export var actor: Node2D
@export var speed: float

@export var input: ActorInput

func has_actor():
	
	if actor: return true


func update_actor(input_vector: Vector2):
	
	actor.velocity = input_vector * speed
	actor.move_and_slide()


func _physics_process(_delta):
	
	if !has_actor():
		push_warning("wating for actor")
		return

	if actor.is_in_group("Player"):
		update_actor(input.get_vector_from_inputs())

	if actor.is_in_group("Obstacle"):
		update_actor(input.get_vector_to_left())
