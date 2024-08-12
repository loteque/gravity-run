extends Movement


func update_actor():

	if !has_actor():
		
		push_warning("wating for actor")
		return

	update_actor_velocity(input.get_vector_to_right())
	actor.move_and_slide()