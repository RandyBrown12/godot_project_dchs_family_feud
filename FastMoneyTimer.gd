extends Label

@onready var animation_player = $"../AnimationPlayer"

func _on_button_pressed():
	animation_player.play("Timer")
	$"../25SecsSFX".play()

