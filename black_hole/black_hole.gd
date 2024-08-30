extends Node2D

@export var player: CharacterBody2D


@export var event_horizon_width: int = 128:
    set(width):
        effect.event_horizon_width = width
        event_horizon_width = width


@export var inversion_width: int = 460:
    set(width):
        effect.event_horizon_width = width
        event_horizon_width = width


@export var scale_factor: float = 1.0:
    set(factor):
        scale_factor = factor
        if effect:
            effect.effect_scale_factor = factor
            effect.scale_factor = factor
        if gravity_area:
            gravity_area.scale = Vector2(factor, factor)
        if hit_box: 
            hit_box.scale = Vector2(factor, factor)


@onready var effect: CanvasLayer = get_node("BlackHoleEffect"):
    set(new_effect):
        effect = new_effect
        effect.effect_scale_factor = scale_factor
        effect.scale_factor = scale_factor   


@onready var gravity_area: Gravity = get_node("GravityArea")
@onready var hit_box: HitBox = get_node("HitBox")


func enlarge():
    print("nom nom nom")
    scale_factor += 0.5


func is_in_gravity_area(detectable_gravity_area: Gravity) -> bool:
    
    return detectable_gravity_area in gravity_area.get_overlapping_areas()


func update_screen_glitch():

    var detectable_gravity_area = player.get_node("Gravity")

    if is_in_gravity_area(detectable_gravity_area):

        var gravity_force_on_player = detectable_gravity_area.force
        var updated_pow = effect.glitch_effect.shake_power + gravity_force_on_player.normalized().length_squared() / 10000
        
        effect.glitch_effect.shake_power = updated_pow
        if effect.glitch_effect.color_rate == 0.0: effect.glitch_effect.color_rate = 0.01
    
    else:
        
        effect.glitch_effect.color_rate = 0.0
        effect.glitch_effect.shake_power = 0.0


func _process(_delta):
    
    if player:
        
        update_screen_glitch()
