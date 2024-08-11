extends VBoxContainer

@export var buttons: Array[Button]


func _on_start_pressed():

	StageLoader.load_new_stage(0)
	GameState.unpause_stage()


func _on_quit_pressed():

	StageLoader.load_new_stage(1)
	GameState.unpause_stage()


func _on_continue_pressed():

	MenuScreen.hide_menu_screen()
	GameState.unpause_stage()