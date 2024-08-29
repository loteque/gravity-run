@tool
extends ColorRect

@export var shake_power: float = material.get_shader_parameter("shake_power"):
    set(pow):
        material.set_shader_parameter("shake_power", pow)
        shake_power = pow

@export var shake_rate: float = material.get_shader_parameter("shake_rate"):
    set(rate):
        material.set_shader_parameter("shake_rate", rate)
        shake_rate = rate

@export var shake_speed: float = material.get_shader_parameter("shake_speed"):
    set(speed):
        material.set_shader_parameter("shake_speed", speed)
        shake_speed = speed

@export var block_size: float = material.get_shader_parameter("shake_block_size"):
    set(size):
        material.set_shader_parameter("shake_block_size", size)
        block_size = size

@export var color_rate: float = material.get_shader_parameter("shake_color_rate"):
    set(rate):
        material.set_shader_parameter("shake_color_rate", rate)
        color_rate = rate