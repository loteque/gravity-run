extends ProgressBar
class_name CountdownBar

@export var bullet_type: Muzzle.BulletType

var timer

func _ready():
    owner.upgrades.cooldown_timer_started.connect(_on_cooldown_timer_started)


func _on_cooldown_timer_started(type, cooldown_timer):
    
    if type == bullet_type:

        timer = cooldown_timer
        max_value = cooldown_timer.wait_time

func update_bar():

    if timer:
    
        value = timer.time_left


func _process(_delta):

    update_bar()