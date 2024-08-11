extends Node

@export var target_node: Sprite2D
@export var flash_color: Color
@export var flash_duration: float
@onready var flash_material: ShaderMaterial =  ShaderMaterial.new()

func _ready():
    assert(target_node.material == null, "Target node must not have material. Material would be overwritten.")
    target_node.material = flash_material
    target_node.material.set_shader_parameter("color", flash_color)

func flash():
    target_node.material.set_shader_parameter("is_on", true)
    await get_tree().create_timer(flash_duration).timeout
    target_node.material.set_shader_parameter("is_on", false)
