extends Control

@onready var x_timer = $XTimer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_button_2_pressed():
	$"../WrongSFX".play()
	$"../AnimationPlayer".play("X"+str(Global.X))
	for child in get_children():
		if child.get_meta("X") == Global.X:
			child.visible = true
	x_timer.start()
	Global.X += 1

func _on_x_timer_timeout():
	for child in get_children():
		if child is Sprite2D:
			child.visible = false
