extends Marker2D
class_name Muzzle

enum BulletType {

	DEFAULT,
	LAZER,
	TORPEDO,
	SM_BOMB,
	LG_BOMB,

}

@export var bullet: PackedScene
@export var bullet_type: BulletType = BulletType.DEFAULT
@export var fire_delay: float = 0.1
@export var player_state: PlayerState
@export var firing_sfx: AudioStreamPlayer
@export var group: StringName = &"Player"
@export var fire_direction: ActorInput.MovementVector
@export var bullet_animation: StringName

@onready var cooldown_timer = Timer.new()

var is_active: bool
var can_shoot: bool = true


func get_fire_dir() -> Vector2:

	return ActorInput.movement_vector[fire_direction]


func shoot():
	
	if !can_shoot:

		return

	var bullet_node = bullet.instantiate()
	var world = get_tree().get_first_node_in_group("World")
	var bullet_hitbox = bullet_node.hit_box
	var bullet_movement = bullet_node.movement
	
	bullet_node.anim_str_name = bullet_animation
	
	bullet_movement.bullet_direction = get_fire_dir()
	bullet_hitbox.add_to_group(group)
	bullet_node.global_position = global_position
	bullet_node.hit_box.owner_id = player_state.ID
	firing_sfx.play()
	world.add_child(bullet_node)

	# HACK
	var upgrades
	if !get_parent().name == "Player":

		upgrades = owner

		can_shoot = false
		cooldown_timer.start()
		upgrades.cooldown_timer_started.emit(bullet_type, cooldown_timer)
		await cooldown_timer.timeout
		can_shoot = true


func handle_shoot_event(event):

	if event.pressed:
		
		match event.keycode:

			KEY_SPACE:

				if bullet_type != BulletType.DEFAULT: return;

				shoot()

			KEY_X:

				if bullet_type != BulletType.LAZER: return

				shoot()
		
			_: 

				return

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

	
	cooldown_timer.wait_time = fire_delay
	cooldown_timer.one_shot = true
	add_child(cooldown_timer)