extends Button

@onready var animation_player = $"../Frame/Control/AnimationPlayer"
var buttonpressed = 0

func _on_pressed():
	if buttonpressed == 0:
		animation_player.play("control")
	elif buttonpressed == 1:
		animation_player.play("slide past")
		$"../AnimationPlayer".play("Timer",-1,-25,true)
	buttonpressed += 1
