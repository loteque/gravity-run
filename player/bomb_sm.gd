extends Bullet

@onready var explosion: Sprite2D = get_node("Explosion")
@onready var explosion_animation_player: AnimationPlayer = get_node("AnimationPlayer")
@onready var explosion_timer: Timer = get_node("ExplosionTimer")

func _ready():

    explosion_timer.start()
    await explosion_timer.timeout
    movement.speed = 0
    explosion.show()
    explosion_animation_player.play("energy_expansion")
    await explosion_animation_player.animation_finished
    queue_free()