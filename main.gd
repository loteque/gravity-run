extends Node
class_name Main


static func handle_game_over():

	GameState.end_stage()
	MenuScreen.show_game_over()


func handle_pause_event(event):
	
	if event.pressed and event.keycode == KEY_ESCAPE:
	
		if GameState.is_paused == true:

			GameState.unpause_stage()
			MenuScreen.hide_menu_screen()
		
		else:
			
			GameState.pause_stage()
			MenuScreen.show_pause()


func _unhandled_input(event):
    
	if !(event is InputEventKey):
        
		return

	handle_pause_event(event)
        

