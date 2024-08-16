extends CanvasLayer
class_name DialogBox

@export var portrait_display: MarginContainer
@export var name_display: Label
@export var dialog_display: Label

var portrait: TextureRect:
    set(new_portrait):
        if portrait_display.get_child_count() != 0:
            portrait_display.get_child(0).queue_free()
        
        portrait_display.add_child(new_portrait)
        portrait = new_portrait

var char_name: String:
    set(new_char_name):
        name_display.text = new_char_name
        char_name = new_char_name

var dialog: String:
    set(new_dialog):
        dialog_display.text = new_dialog
        dialog = new_dialog


# func _ready():
    
#     portrait = preload("res://ui/dialog_box/portraits/goose.tscn").instantiate()
#     char_name = "Sir Quacks Alot"
#     dialog = "Quack!"