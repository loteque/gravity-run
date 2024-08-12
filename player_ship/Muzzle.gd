extends Marker2D


@export var bullet: PackedScene


func shoot():
	
	var bullet_node = bullet.instantiate()
	var world = get_tree().get_first_node_in_group("World")
	bullet_node.global_position = global_position
	world.add_child(bullet_node)


func handle_shoot_event(event):

	if event.pressed and event.keycode == KEY_SPACE:
		
		shoot()


func _unhandled_input(event):

	if !(event is InputEventKey):
		
		return

	handle_shoot_event(event)
