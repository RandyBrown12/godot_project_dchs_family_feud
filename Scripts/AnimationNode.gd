extends Node

var cycle = 1
var FPS = 6

func _ready():
	for child in get_children():
		child.set_meta("Clicked",false)
		child.set_speed_scale(FPS)


func _on_reset_button_pressed():
	if Global.score > 0:
		Global.pressed = true
	if Global.revealstate == false:
		$"../AnimationPlayer".play_backwards("EagleFeud")
	Global.score = 0
	for child in get_children():
			if child.get_meta("Clicked"):
				child.play_backwards(str(str(str(child).left(1)),"_",Global.phase))
				await get_tree().create_timer(0.33333).timeout
				child.play_backwards("Empty")
				child.set_frame_and_progress(9,0)
				child.set_meta("Clicked",false)
	Global.phase += 1
	Global.X = 1
	Global.revealstate = false
	if Global.phase == 2:
		$"../Reset Button".visible = false
	

func _on_reveal_button_pressed():
	for child in get_children():
		if child.get_meta("Score")[Global.phase - 1] != 0:
			$"../WooshSFX".play()
			child.play(str("Reveal",str(str(child)).left(1)))
			await get_tree().create_timer(0.25).timeout
			for child2 in child.get_children():
				child2.visible = true
	$"../AnimationPlayer".play("EagleFeud")


