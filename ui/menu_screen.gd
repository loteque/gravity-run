extends CanvasLayer
class_name MenuScreen


@export var menu: VBoxContainer
@export var titles: Array[TextureRect]
@export var title_texture_rect: TextureRect

static var menu_buttons: Array[Button]
static var title_textures: Array[TextureRect]
static var menu_screen: MenuScreen
static var title_image: TextureRect

func _ready():
	MenuScreen.menu_buttons = menu.buttons
	MenuScreen.title_textures = titles
	MenuScreen.menu_screen = self
	MenuScreen.title_image = title_texture_rect

static func hide_button(button):
	button.visible = false


static func show_button(button: Button):
	button.visible = true


static func hide_title(title: TextureRect):
	title.visible = false


static func show_title(title: TextureRect):
	title.visible = true


static func show_title_image():
	title_image.visible = true


static func hide_title_image():
	title_image.visible = false


static func hide_menu_screen():
	menu_screen.visible = false


static func show_game_over():
	
	show_button(menu_buttons[1])
	hide_button(menu_buttons[2])
	hide_button(menu_buttons[0])
	show_title(title_textures[2])
	hide_title(title_textures[0])
	hide_title(title_textures[1])

	menu_buttons[1].grab_focus()
	hide_title_image()
	menu_screen.visible = true


static func show_start_screen():
	
	show_button(menu_buttons[0])
	hide_button(menu_buttons[1])
	hide_button(menu_buttons[2])
	show_title(title_textures[0])
	hide_title(title_textures[1])
	hide_title(title_textures[2])
	
	if State.campaign_completed:

		show_button(menu_buttons[3])

		menu_buttons[0].focus_neighbor_bottom = menu_buttons[3].get_path()
		menu_buttons[3].focus_neighbor_top = menu_buttons[0].get_path()

		menu_buttons[3].grab_focus()
	
	else:

		menu_buttons[0].grab_focus()

	show_title_image()
	menu_screen.visible = true


static func show_pause():
	
	show_button(menu_buttons[1])
	show_button(menu_buttons[2])
	hide_button(menu_buttons[0])
	hide_button(menu_buttons[3])
	show_title(title_textures[1])
	hide_title(title_textures[0])
	hide_title(title_textures[2])
	
	menu_buttons[2].focus_neighbor_top = menu_buttons[1].get_path()
	menu_buttons[1].focus_neighbor_bottom = menu_buttons[2].get_path()

	menu_buttons[2].grab_focus()
	hide_title_image()
	menu_screen.visible = true

