extends HurtBox

func damage(hitbox: Area2D):

    if actor.is_in_group("Player"):
    
        actor_state.health_updated.emit(health)
        super.damage(hitbox)