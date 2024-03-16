extends Button


func _on_pressed():
	Global.revealstate = true
	$"../AnimationPlayer".play_backwards("EagleFeud")
	print("pressed")
