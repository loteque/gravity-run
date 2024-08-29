extends CanvasLayer

@onready var invert_effect: Sprite2D = get_node("%Invert")
@onready var event_horizon_effect: Sprite2D = get_node("%EventHorizon")
@onready var glitch_effect: Control = get_node("%Glitch")

@onready var inversion_radius: int = floor(inversion_width / 2.0):
    set(rad):
        invert_effect.texture.height = rad * 2
        invert_effect.texture.width = rad * 2
        inversion_radius = rad


@onready var event_horizon_radius: int = floor(event_horizon_width / 2.0):
    set(rad):
        event_horizon_effect.texture.height = rad * 2
        event_horizon_effect.texture.width = rad * 2
        event_horizon_radius = rad


@onready var effect_scale_factor: float = 1.0:
    set(factor):
        inversion_radius = floor(inversion_width / 2.0 * factor)
        event_horizon_radius = floor(event_horizon_width / 2.0 * factor)
        effect_scale_factor = factor


var follow_target: Node2D:
    set(target):
        invert_effect.follow_target = target
        event_horizon_effect.follow_target = target


var event_horizon_width: int = 128
var inversion_width: int = 460


@onready var scale_factor: float = 1.0:
    set(factor):
        effect_scale_factor = factor
        scale_factor = factor