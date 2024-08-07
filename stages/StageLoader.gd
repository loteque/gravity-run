extends Node
class_name StageLoader

var demo_stage = preload("res://stages/stage_demo.tscn")

func _ready():
	var stage = demo_stage.instantiate()
	add_child(stage)