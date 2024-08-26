extends HurtBox

@export var hit_sfx: AudioStreamPlayer
@export var explode: AudioStreamPlayer

func damage(hitbox: Area2D):

    if actor.is_in_group("Player"):
        
        hit_sfx.play()
        super.damage(hitbox)
        actor_state.health_updated.emit(health)

func die(area: Area2D):

    explode.play()
    actor_state.input_paused = true
    sprite.hide()

    super.die(area)
        