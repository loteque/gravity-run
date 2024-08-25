extends HurtBox

func damage(hitbox: Area2D):

    if actor.is_in_group("Player"):
        
        super.damage(hitbox)
        actor_state.health_updated.emit(health)
        