extends Area2D
class_name HurtBox

@export var actor: Node2D
@export var health: int
@export var flash_effect: Node
@export var actor_state: Node


func _ready():
	area_entered.connect(_on_area_entered)


func die(_area: Area2D):

	if !actor: return

	actor.queue_free()

	if actor.is_in_group("Player"):

		Main.handle_game_over()
		

func is_hitbox_valid(hitbox: Area2D) -> bool:

	if hitbox.get_parent() == self.get_parent():
		
		return false

	if !hitbox.is_in_group("Hitbox"):

		return false

	return true


func damage(hitbox: Area2D):

	if !is_hitbox_valid(hitbox): return

	health = health - hitbox.damage

	if flash_effect:
		
		flash_effect.flash()

	if health <= 0:
		
		die(hitbox); return


func _on_area_entered(area: Area2D):
	
	damage(area)
