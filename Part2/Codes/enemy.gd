extends CharacterBody2D
var player
var speed = 120
var health = 5
const damage_rate = 5
@onready var deathsprite = $AnimatedSprite2D
func _ready():
	player = get_node("/root/Level/Player")

func _physics_process(delta: float):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	health -= damage_rate
	if health <= 0:
		die()
	
func die():
	set_physics_process(false)
	set_process(false)
	velocity = Vector2.ZERO
	collision_layer = 0
	collision_mask = 0
	if deathsprite:
		deathsprite.play("death_animation")
		await deathsprite.animation_finished
	queue_free()
