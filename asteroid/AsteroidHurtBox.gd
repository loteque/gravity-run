extends HurtBox


func is_hitbox_valid(hitbox: Area2D) -> bool:

	if hitbox.get_parent().is_in_group("Obstacle"):

		return false

	return super.is_hitbox_valid(hitbox)


func die(area: Area2D):
	
	if is_hitbox_valid(area):

		GameState.player_state.get("player1").asteroid_killed.emit()
	
	super.die(area)


func _on_area_entered(area: Area2D):
		
	damage(area)
