extends Node
class_name Main

@export var unlock_endless: bool

var cursor_timer: Timer = Timer.new() 


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


func start_cursor_timeout(wait_time: float):

	cursor_timer.wait_time = wait_time
	cursor_timer.start()


func _unhandled_input(event):
    
	if event is InputEventMouseMotion:

		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		start_cursor_timeout(3.0)


	if !(event is InputEventKey):
        
		return

	handle_pause_event(event)
        
func _ready():
	
	add_child(cursor_timer)
	cursor_timer.timeout.connect(_on_cursor_timer_timeout)
	start_cursor_timeout(10.0)

	if unlock_endless and OS.is_debug_build():
		GameState.campaign_completed = true
		MenuScreen.show_start_screen()

func _process(_delta):

	if Input.is_action_just_pressed("ui_cancel"):

		if GameState.is_paused == true:

			GameState.unpause_stage()
			MenuScreen.hide_menu_screen()
		
		else:
			
			GameState.pause_stage()
			MenuScreen.show_pause()


func _on_cursor_timer_timeout():

	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)