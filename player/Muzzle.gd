extends Marker2D


@export var bullet: PackedScene
@export var player_state: PlayerState
@export var firing_sfx: AudioStreamPlayer

var is_active: bool

func shoot():
	
	var bullet_node = bullet.instantiate()
	var world = get_tree().get_first_node_in_group("World")
	bullet_node.global_position = global_position
	bullet_node.hit_box.owner_id = player_state.ID
	firing_sfx.play()
	world.add_child(bullet_node)
	


func handle_shoot_event(event):

	if event.pressed and event.keycode == KEY_SPACE:
		
		shoot()


func _unhandled_input(event):

	if !(event is InputEventKey):
		
		return

	if player_state.input_paused:

		return

	if !is_active:

		return

	handle_shoot_event(event)

func _ready():
	if get_parent().visible:
		is_active = true