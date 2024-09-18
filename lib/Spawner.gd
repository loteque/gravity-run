extends Node2D
class_name Spawner

@export var active: bool
@export var timer_name: StringName
@export var wait_max: float
@export var spawn_object: PackedScene

var is_paused: bool
func pause(spawner):

	spawner.is_paused = true

func start(spawner):

	spawner.is_paused = false


class SpawnTimer extends Timer:

	var max_range: float


	func gen_wait_time():
		
		return randf_range(0, max_range)


	func _init(timer_name: String, timer_max_range: float):
		
		name = timer_name
		autostart = true
		max_range = timer_max_range
		timeout.connect(_on_timeout)
		wait_time = gen_wait_time()


	func _on_timeout():
		
		wait_time = gen_wait_time()


func _ready():
	
	GameState.spawner_state.merge({&"asteroid_spawner": self})

	var spawn_timer := SpawnTimer.new(timer_name, wait_max)
	spawn_timer.timeout.connect(_on_timeout)
	add_child(spawn_timer)


func get_rand_spawn_point():
	
	var rand_idx: int = randi_range(0, get_child_count() - 2)
	return get_child(rand_idx)


func spawn(_init_args: Array[Variant] = []):

	if is_paused: return

	var spawn_point: Marker2D = get_rand_spawn_point()
	var spawn_node: Node2D = spawn_object.instantiate()
	spawn_point.add_child(spawn_node)


func _on_timeout():
	if active:
		spawn()

	

	



	
	
	
