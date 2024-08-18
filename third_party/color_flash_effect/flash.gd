extends Node

@export var target_node: Sprite2D
@export var flash_color: Color
@export var flash_duration: float


func _ready():

	target_node.material.set_shader_parameter("color", flash_color)
	target_node.material.set_shader_parameter("is_on", false)


func flash():
	
	target_node.material.set_shader_parameter("is_on", true)
	await get_tree().create_timer(flash_duration).timeout
	target_node.material.set_shader_parameter("is_on", false)
