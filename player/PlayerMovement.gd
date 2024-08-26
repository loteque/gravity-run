extends Movement

@export var player_state: PlayerState


func update_actor():
    
    super.update_actor()

    if actor.is_in_group("Player"):
		
        update_actor_velocity(input.get_vector_from_inputs())


func _physics_process(_delta):

    if !player_state: return

    if player_state.input_paused: return

    update_actor()