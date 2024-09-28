extends TextureRect
class_name UpgradeCard

@onready var cost_tray: BoxContainer = %Cost
@onready var part_image: GridContainer = %PartImage
@onready var return_tray: BoxContainer = %Gain

static var all_cards = [

    preload("res://player/ui/upgrade_panel/cards/cannon_port.tres"),
    preload("res://player/ui/upgrade_panel/cards/cannon_starboard.tres"),
    preload("res://player/ui/upgrade_panel/cards/spread_bow.tres"),
    preload("res://player/ui/upgrade_panel/cards/launch_tube_port_small.tres"),
    preload("res://player/ui/upgrade_panel/cards/launch_tube_starboard_small.tres"),
    preload("res://player/ui/upgrade_panel/cards/launch_tube_small.tres"),
    preload("res://player/ui/upgrade_panel/cards/lazer_bow.tres"),
    preload("res://player/ui/upgrade_panel/cards/lazer_stern.tres"),
    preload("res://player/ui/upgrade_panel/cards/lazer_port.tres"),
    preload("res://player/ui/upgrade_panel/cards/lazer_starboard.tres"),
    preload("res://player/ui/upgrade_panel/cards/torpedo_port.tres"),
    preload("res://player/ui/upgrade_panel/cards/torpedo_starboard.tres"),
    preload("res://player/ui/upgrade_panel/cards/spread_stern.tres")
]

var card

var data

signal card_selected(data)

static func get_random_card():
    
    var cards_idx_max = all_cards.size() - 1
    return all_cards[randi_range(0, cards_idx_max)]


func compile_card(new_card):

    card = new_card

    for i in card.cost:
        
        var cost_tex_rect = TextureRect.new()
        cost_tex_rect.texture = card.cost_rect
        cost_tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
        cost_tray.add_child(cost_tex_rect)

    for i in card.return_value:

        var return_tex_rect = TextureRect.new()
        return_tex_rect.texture = card.return_rect
        return_tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
        return_tray.add_child(return_tex_rect)

    var part_tex_rect = TextureRect.new()
    part_tex_rect.texture = card.part_image
    part_tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
    part_image.add_child(part_tex_rect)

    data = {
    
    &"type": card.upgrade_type, 
    &"cost": card.cost, 
    &"id": card.id, 
    &"wing_type": card.wing_type,
    &"ship_section": card.ship_section, 
    &"return_type": card.return_type, 
    &"return_value": card.return_value,
    &"object": self,
    
    }


func _ready():
    
    if get_parent().name != &"UpgradesRow":
    
        return
    
    set_focus_mode(FOCUS_ALL)
    focus_entered.connect(_on_focus_enterd)
    focus_exited.connect(_on_focus_exited)
    self_modulate = Color(0,0,0,1)
    
    get_parent().get_child(0).grab_focus.call_deferred()

func _on_focus_enterd():

    self_modulate = Color(1,1,1,1)

func _on_focus_exited():

    self_modulate = Color(0,0,0,1)


func _get_drag_data(_at_position):
    
    print("dragged")
    
    var prev: TextureRect = self.duplicate()
    prev.z_index = 1

    set_drag_preview(prev)
    prev.compile_card(card)
    prev.texture = null
    prev.get_node("ColorRect").hide()
    prev.part_image.hide()
    prev.return_tray.hide()
    
    print(prev.size, prev.global_position, prev.z_index)

    return data

func _process(_delta):

    if get_parent().name != &"UpgradesRow":

        return

    if Input.is_action_just_pressed("ui_accept") and has_focus():

        card_selected.emit(data)