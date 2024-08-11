extends Sprite2D

@export var follow_target: Node2D

func _process(_delta):
    global_position = follow_target.global_position
