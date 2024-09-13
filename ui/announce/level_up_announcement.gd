extends Control

@export var playing: bool = false

@onready var l_title: Label = get_node("CenterContainer/HBoxContainer/LevelTitle")
@onready var l_amnt: Label = get_node("CenterContainer/HBoxContainer/LevelAmount")
@onready var anim: AnimationPlayer = get_node("CenterContainer/AnimationPlayer")

var player_state
var level_value


func play():
    
    l_amnt.text = str(level_value)
    anim.play("slide_in")


func _ready():

    GameState.player_state_added.connect(_on_player_state_added)


func _on_player_state_added(new_player_state):
    
    player_state = new_player_state
    player_state.level_updated.connect(_on_player_level_updated)


func _on_player_level_updated(level):
    
    level_value = level
    play()