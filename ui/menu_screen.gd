extends CanvasLayer
class_name MenuScreen


@export var menu: VBoxContainer
@export var titles: Array[TextureRect]

static var menu_buttons: Array[Button]
static var title_textures: Array[TextureRect]
static var menu_screen: MenuScreen


func _ready():
	MenuScreen.menu_buttons = menu.buttons
	MenuScreen.title_textures = titles
	MenuScreen.menu_screen = self


static func hide_button(button):
	button.visible = false


static func show_button(button: Button):
	button.visible = true


static func hide_title(title: TextureRect):
	title.visible = false


static func show_title(title: TextureRect):
	title.visible = true


static func hide_menu_screen():
	menu_screen.visible = false


static func show_game_over():
	
	show_button(menu_buttons[1])
	hide_button(menu_buttons[2])
	hide_button(menu_buttons[0])
	show_title(title_textures[2])
	hide_title(title_textures[0])
	hide_title(title_textures[1])
	menu_screen.visible = true


static func show_start_screen():
	
	show_button(menu_buttons[0])
	hide_button(menu_buttons[1])
	hide_button(menu_buttons[2])
	show_title(title_textures[0])
	hide_title(title_textures[1])
	hide_title(title_textures[2])
	menu_screen.visible = true


static func show_pause():
	
	show_button(menu_buttons[1])
	show_button(menu_buttons[2])
	hide_button(menu_buttons[0])
	show_title(title_textures[1])
	hide_title(title_textures[0])
	hide_title(title_textures[2])
	menu_screen.visible = true

