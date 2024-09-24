extends Movement

var bullet_direction: Vector2

func update_actor():

	if !has_actor():
		
		push_warning("wating for actor")
		return

	update_actor_velocity(bullet_direction)
	actor.move_and_slide()