extends Node
class_name StageLoader

static var stages = preload("res://stages/stages.tres")
static var current_stage: Node
static var loader_node: StageLoader


static func unload_current_stage():
	
	current_stage.queue_free()


static func load_new_stage(stage_idx):
	
	if current_stage:
		unload_current_stage()
	
	var stage = stages.stages[stage_idx] 

	current_stage = stage.instantiate()
	loader_node.add_child(current_stage)


func _ready():

	StageLoader.loader_node = self
	StageLoader.load_new_stage(1)