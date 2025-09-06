extends Node2D

var met_scene:PackedScene=load("res://enemy.tscn")
#func _on_timer_timeout() -> void:
	#var meteor = met_scene.instantiate()
	#add_child(meteor)



func _on_enemt_timer_timeout() -> void:
	var meteor = met_scene.instantiate()
	var x= randf_range(0,500)
	var y = randf_range(0,500)
	meteor.position = Vector2(x,	y) # Random x, just above screen

	$enemy.add_child(meteor)
