extends HurtBox


func die():
	
	GameState.player_state.get("player1").asteroid_killed.emit()
	super.die()


func _on_area_entered(area: Area2D):
		
	damage(area)
