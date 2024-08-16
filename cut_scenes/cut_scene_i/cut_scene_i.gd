extends Node2D

@export var dialog_box: DialogBox
@export var backdrops: Array[TextureRect]
@export var dialog: Array[String]
@export var props: Array[Node2D]


func clear_part(backdrop: TextureRect = null, current_props: Array[Node2D] = []):

    if backdrop:

        backdrop.hide()

    if !current_props.is_empty(): 

        for prop in current_props:

            prop.hide()

    dialog_box.hide()


func play_part_1():
    
    props[0].show()
    await get_tree().create_timer(1).timeout
    dialog_box.portrait = preload("res://ui/dialog_box/portraits/quacker.tscn").instantiate()
    dialog_box.char_name = "Comdr. Quackers"
    dialog_box.dialog = dialog[0]
    dialog_box.show()


func play_part_2():

    clear_part()
    await get_tree().create_timer(1).timeout
    backdrops[0].show()
    await get_tree().create_timer(1).timeout
    dialog_box.portrait = preload("res://ui/dialog_box/portraits/goose.tscn").instantiate()
    dialog_box.char_name = "General Goose"
    dialog_box.dialog = dialog[1]
    dialog_box.show()


func play_part_3():
    
    dialog_box.dialog = dialog[2]


func play_part_4():
    
    dialog_box.dialog = dialog[3]


func play_part_5():

    dialog_box.portrait = preload("res://ui/dialog_box/portraits/quacker.tscn").instantiate()
    dialog_box.char_name = "Comdr. Quacker"
    dialog_box.dialog = dialog[4]


func play_part_6():

    clear_part(backdrops[0])
    await get_tree().create_timer(1).timeout
    
    var countdown = get_node("RaceCountdown/CountDown")

    var prev_count = null
    for count in countdown.get_children():
        
        if prev_count:
            
            prev_count.hide()

        await get_tree().create_timer(.5).timeout
        count.show()

    await get_tree().create_timer(.5).timeout
    StageLoader.load_new_stage(0)


func play_scene_part(part: int):

    match part:
        
        1:
            play_part_1()

        2:
            play_part_2()
        
        3:
            play_part_3()

        4:
            play_part_4()

        5:
            play_part_5()

        6:
            play_part_6()
        
        _:
            return


func _ready():
    play_scene_part(1)


var current_part: int = 0
func _unhandled_input(event):
    
    if !(event is InputEventKey):
        
        return

    
    if event.pressed and event.keycode == KEY_SPACE:
        
        current_part += 1
        play_scene_part(current_part)