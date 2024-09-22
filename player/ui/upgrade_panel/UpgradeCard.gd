extends TextureRect

@onready var cost_tray: BoxContainer = %Cost
@onready var part_image: TextureRect = %PartImage
@onready var return_tray: BoxContainer = %Gain

var all_cards = [

    preload("res://player/ui/upgrade_panel/cards/cannon_port.tres"),
    preload("res://player/ui/upgrade_panel/cards/cannon_starboard.tres")

]

var card


func get_random_card():
    
    var cards_idx_max = all_cards.size() - 1
    return all_cards[randi_range(0, cards_idx_max)]


func compile_card():

    card = get_random_card()

    for i in card.cost:
        
        var cost_tex_rect = TextureRect.new()
        cost_tex_rect.texture = card.cost_rect
        cost_tray.add_child(cost_tex_rect)

    for i in card.return_value:

        var return_tex_rect = TextureRect.new()
        return_tex_rect.texture = card.return_rect
        return_tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
        return_tray.add_child(return_tex_rect)

    part_image.texture = card.part_image


func _ready():
    
    compile_card()


func _get_drag_data(_at_position):
    
    print("dragged")
    
    var prev: TextureRect = self.duplicate()
    prev.z_index = 1

    set_drag_preview(prev)
    
    print(prev.size, prev.global_position, prev.z_index)
    return {
        
        &"type": card.upgrade_type, 
        &"cost": card.cost, 
        &"wing_type": card.wing_type, 
        &"id": card.id, 
        &"return_type": card.return_type, 
        &"return_value": card.return_value,
        &"object": self,
    
    }


