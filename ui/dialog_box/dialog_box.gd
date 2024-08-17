extends CanvasLayer
class_name DialogBox

@export var portrait_display: TextureRect
@export var name_display: Label
@export var dialog_display: Label

var portrait: Texture2D:
    set(new_portrait):
        portrait_display.texture = new_portrait
        portrait = new_portrait

var char_name: String:
    set(new_char_name):
        name_display.text = new_char_name
        char_name = new_char_name

var dialog: String:
    set(new_dialog):
        dialog_display.text = new_dialog
        dialog = new_dialog


func show_box():
    
    get_node("HBoxContainer").show()


func hide_box():
    
    get_node("HBoxContainer").hide()

# func _ready():
    
#     portrait = preload("res://ui/dialog_box/portraits/goose.tscn").instantiate()
#     char_name = "Sir Quacks Alot"
#     dialog = "Quack!"