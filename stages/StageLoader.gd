extends Node
class_name StageLoader

static var stages = preload("res://stages/stages.tres")
static var current_stage: Node
static var loader_node: StageLoader
static var current_stage_idx: int

static func unload_current_stage():
	
	current_stage.queue_free()


static func load_new_stage(stage_idx):
	
	if current_stage:
		unload_current_stage()
	
	var stage = stages.stages[stage_idx] 

	current_stage = stage.instantiate()

	if current_stage is EventSequencer:

		current_stage.done.connect(loader_node._on_stage_done)

	loader_node.add_child(current_stage)
	current_stage_idx = stage_idx


func _ready():

	StageLoader.loader_node = self
	StageLoader.load_new_stage(1)


func _on_stage_done():
	
	if current_stage.has_signal("done") and current_stage.is_connected("done", loader_node._on_stage_done):
		
		current_stage.disconnect("done", loader_node._on_stage_done)

	# var next_stage = current_stage_idx + 1

	# if next_stage >= stages.stages.size():
		
	# 	return

	StageLoader.load_new_stage(0)