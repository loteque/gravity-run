extends HurtBox

func damage(hitbox: Area2D):

    if actor.is_in_group("Player"):
        
        super.damage(hitbox)
        actor_state.health_updated.emit(health)

func die(area: Area2D):

    actor_state.input_paused = true
    sprite.hide()
    animations.show()
    animations.play("death")
    await get_tree().create_timer(1.5).timeout
    super.die(area)
        