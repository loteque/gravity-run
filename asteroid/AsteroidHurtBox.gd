extends HurtBox

@export var explode_sfx: AudioStreamPlayer

func is_hitbox_valid(hitbox: Area2D) -> bool:

	if hitbox.get_parent().is_in_group("Obstacle"):

		return false

	return super.is_hitbox_valid(hitbox)


func die(area: Area2D):
	
	sprite.hide()
	
	if !explode_sfx.playing:
		
		explode_sfx.play()
	
	if area.is_in_group("BlackHole"):

		area.get_parent().enlarge()

	if hit_box:
	
		hit_box.process_mode = PROCESS_MODE_DISABLED

	if is_hitbox_valid(area):

		if !area.owner_id: return

		if !GameState.player_state.get(area.owner_id).is_actor_player: return

		GameState.player_state.get(area.owner_id).asteroid_killed.emit()
	

	super.die(area)


func _on_area_entered(area: Area2D):
		
	damage(area)
