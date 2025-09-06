extends CharacterBody2D

var speed = 250
func _ready():
	position = Vector2(127, 271)
	scale=Vector2(1,1)

func _process(delta):

	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("Right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_left")or Input.is_action_pressed("Left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_up")or Input.is_action_pressed("Up"):
		position.y -= speed* delta
	if Input.is_action_pressed("ui_down")or Input.is_action_pressed("Down"):
		position.y += speed* delta
	if Input.is_action_pressed("Shift"):
		speed = 500
	else:
		speed = 250
	move_and_slide()
