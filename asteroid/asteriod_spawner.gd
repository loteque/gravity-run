extends Spawner

func _ready():
	
	GameState.spawner_state.merge({&"asteroid_spawner": self})

	var spawn_timer := SpawnTimer.new(timer_name, wait_max)
	spawn_timer.timeout.connect(_on_timeout)
	add_child(spawn_timer)