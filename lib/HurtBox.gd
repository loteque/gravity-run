extends Area2D
class_name HurtBox

@export var actor: Node2D
@export var health: int
@export var flash_effect: Node

func _ready():
    area_entered.connect(_on_area_entered)


func die():

    if !actor: return
    
    actor.queue_free()

    if actor.is_in_group("Player"):

        Main.handle_game_over()
        

func damage(hitbox: Area2D):
    
    if hitbox.get_parent() == self.get_parent():
        
        return

    if !hitbox.is_in_group("Hitbox"):

        return

    if health <= 0:
        
        die(); return

    health = health - hitbox.damage
    flash_effect.flash()


func _on_area_entered(area: Area2D):
        
    damage(area)
