extends Node
class_name Movement

@export var actor: Node2D
@export var speed: float

@export var input: ActorInput
@export var gravity: Gravity

func has_actor():
	
	if actor: return true


func update_actor_velocity(input_vector): 
	
	actor.velocity = input_vector * speed + gravity.force


func update_actor():

	if !has_actor():
		
		push_warning("wating for actor")
		return

	if actor.is_in_group("Player"):
		
		update_actor_velocity(input.get_vector_from_inputs())

	if actor.is_in_group("Obstacle"):

		update_actor_velocity(input.get_vector_to_left())

	actor.move_and_slide()


func _physics_process(_delta):

	update_actor()
	
	

