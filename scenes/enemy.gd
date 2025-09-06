extends Area2D
var speed: int
var rotation_speed: int
var direction_x: float

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var x= rng.randi_range(0,500)
	var y = rng.randi_range(0,500)
	position = Vector2(x,y)
	speed =rng.randi_range(200,500)
	direction_x = rng.randf_range(-1,1)
func _process(delta: float) -> void:
	# Move downward every frame
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

	# Remove meteor if it goes off-screen (bottom)
	#if position.y > 600:  # adjust 600 to your screen height
		#queue_free()
func _on_body_entered(body):
	print('body entered')
	print(body)
