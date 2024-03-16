extends Node2D

var pressed = false

func _process(delta):
	if Global.transition == 1:
		Global.score = 0
		$AnimationPlayer.play_backwards("TransitionA")
		await get_tree().create_timer(0.33333).timeout
		Global.transition = 0
		Global.score = 0
	if Global.transition == 2:
		$AnimationPlayer.play("TransitionA")
		await get_tree().create_timer(0.33333).timeout
		Global.transition = 0
		Global.score = 0

