extends CharacterBody2D

var speed =250

var player_state

var bow_equipped = false
var bow_cooldown = true
var arrow = preload("res://Scenes/arrow.tscn")

var mouse_loc_from_player = null

func _physics_process(delta):
#	no mouse_loc_from_player
	mouse_loc_from_player = get_global_mouse_position() - self.position
	
	var direction=Input.get_vector("left","right","up","down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state="walk"
	
	velocity = direction * speed 
	move_and_slide()
	
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	
	if Input.is_action_just_pressed("e"):
		if bow_equipped:
			bow_equipped = false
		else:
			bow_equipped = true
	
	if Input.is_action_just_pressed("left_mouse") and bow_equipped and bow_cooldown:
		bow_cooldown = false
		var arrow_instance = arrow.instantiate()
		arrow_instance.rotation = $Marker2D.rotation
		arrow_instance.global_position = $Marker2D.global_position
		add_child(arrow_instance)
		
		await get_tree().create_timer(0.4).timeout
		bow_cooldown = true
		
	play_anim(direction)
	
func play_anim(dir):
	if !bow_equipped:
		speed=250
		if player_state == "idle":
			$AnimatedSprite2D.play("idle")
		if player_state == "walk":
			if dir.y == -1:
				$AnimatedSprite2D.play("walk-n")
			if dir.y == 1:
				$AnimatedSprite2D.play("walk-s")
			if dir.x == -1:
				$AnimatedSprite2D.play("walk-e")
			if dir.x == 1:
				$AnimatedSprite2D.play("walk-w")
			
			if dir.x > 0.5 and dir.y < -0.5:
				$AnimatedSprite2D.play("walk-ne")
			if dir.x > 0.5 and dir.y > 0.5:
				$AnimatedSprite2D.play("walk-se")
			if dir.x < -0.5 and dir.y > 0.5:
				$AnimatedSprite2D.play("walk-sw")
			if dir.x < -0.5 and dir.y < -0.5:
				$AnimatedSprite2D.play("walk-nw")
				
	if bow_equipped:
		speed=0
		var angle = mouse_loc_from_player.angle() # radians, relative to player
		angle = rad_to_deg(angle)

		if angle > -22.5 and angle <= 22.5:
			$AnimatedSprite2D.play("bow-e")  # East
		elif angle > 22.5 and angle <= 67.5:
			$AnimatedSprite2D.play("bow-se") # Southeast
		elif angle > 67.5 and angle <= 112.5:
			$AnimatedSprite2D.play("bow-s")  # South
		elif angle > 112.5 and angle <= 157.5:
			$AnimatedSprite2D.play("bow-sw") # Southwest
		elif angle > 157.5 or angle <= -157.5:
			$AnimatedSprite2D.play("bow-w")  # West
		elif angle > -157.5 and angle <= -112.5:
			$AnimatedSprite2D.play("bow-nw") # Northwest
		elif angle > -112.5 and angle <= -67.5:
			$AnimatedSprite2D.play("bow-n")  # North
		elif angle > -67.5 and angle <= -22.5:
			$AnimatedSprite2D.play("bow-ne") # Northeast


	if !bow_equipped:
		if player_state == "idle":
			$AnimatedSprite2D.play("idle")
		if player_state == "walk":
			if dir.y == -1:
				$AnimatedSprite2D.play("walk-n")
			if dir.y == 1:
				$AnimatedSprite2D.play("walk-s")
			if dir.x == -1:
				$AnimatedSprite2D.play("walk-e")
			if dir.x == 1:
				$AnimatedSprite2D.play("walk-w")
			
			if dir.x > 0.5 and dir.y < -0.5:
				$AnimatedSprite2D.play("walk-ne")
			if dir.x > 0.5 and dir.y > 0.5:
				$AnimatedSprite2D.play("walk-se")
			if dir.x < -0.5 and dir.y > 0.5:
				$AnimatedSprite2D.play("walk-sw")
			if dir.x < -0.5 and dir.y < -0.5:
				$AnimatedSprite2D.play("walk-nw")

func player():
	pass
