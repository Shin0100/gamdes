extends Node2D


func spawn_mob():
	var slime = preload("res://Scenes/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	slime.global_position = %PathFollow2D.global_position
	add_child(slime)


func _on_timer_timeout() -> void:
	spawn_mob()
