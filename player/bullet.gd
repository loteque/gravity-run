extends CharacterBody2D
class_name Bullet

@export var hit_box: HitBox
@export var movement: Movement
@export var animation: AnimationPlayer

var anim_str_name: StringName

func _on_visible_on_screen_notifier_2d_screen_exited():
	
    queue_free()

func _ready():
    
    if animation:
        
        animation.play(anim_str_name)

