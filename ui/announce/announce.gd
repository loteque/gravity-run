extends CanvasLayer

@export var announcement: Control
@export var endless_unlock: Control

func show_announcement(announcement_node: Control, delay: float):
    
    await get_tree().create_timer(delay).timeout
    announcement_node.show()
    announcement_node.get_node("SfxrStreamPlayer").play()