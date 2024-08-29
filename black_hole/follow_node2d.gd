extends Sprite2D

var follow_target: Node2D

func _process(_delta):
    
    if !follow_target: return

    global_position = follow_target.global_position
