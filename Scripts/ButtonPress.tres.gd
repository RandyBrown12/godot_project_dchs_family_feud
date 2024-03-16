extends Node2D

@onready var anim = self
@onready var phase = $".."
var score: int = 1

func _on_button_pressed():
	anim.play(str((str(self).left(1)),"_",Global.phase))
	print(str(self).left(1))
	set_meta("Clicked",true)
	for child in get_children():
		child.visible = false
	if Global.revealstate == false:
		if Global.phase <= 2:
			Global.score += (get_meta("Score")[Global.phase - 1])
			Global.pressed = true
		elif Global.phase > 2:
			Global.score += (get_meta("Score")[Global.phase - 1] * 2)
			Global.pressed = true
	$"../../RightSFX".play()
