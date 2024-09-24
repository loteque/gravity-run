extends Area2D
class_name HurtBox

@export var actor: Node2D
@export var health: int
@export var flash_effect: Node
@export var actor_state: Node
@export var sprite: Sprite2D
@export var hit_box: HitBox
@export var animations: AnimatedSprite2D
@export var death_particles: CPUParticles2D

func _ready():
	area_entered.connect(_on_area_entered)


func die(_area: Area2D):
	
	if !actor: return

	if animations:

		animations.show()
		animations.play("death")
		await animations.animation_finished

	if death_particles:

		death_particles.emitting = true
		await death_particles.finished
	
	actor.queue_free()

	if !actor.is_in_group("Bullet"):
		if actor.is_in_group("Player"):

			Main.handle_game_over()
		

func is_hitbox_valid(hitbox: Area2D) -> bool:

	if hitbox.get_parent() == self.get_parent():
		
		return false

	# HACK to make sure the player's bullets don't damage player stuff
	if actor.is_in_group("Player") and hitbox.is_in_group("Player"):

		return false

	if actor.is_in_group("Bullet") and hitbox.is_in_group("Player"):


		return false
	#

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
