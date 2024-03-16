extends Label
@onready var left_label = $"../Left_Label"
@onready var right_label = $"."

var score = 0

func _process(delta):
	if self == left_label:
		left_label.text = str(Global.score_left)
	elif self == right_label:
		right_label.text = str(Global.score_right)
	
func _on_button_pressed():
	Global.pressed = true
	print(Global.score)
	if self == left_label:
		Global.score_left += Global.score
		print(Global.score_left)
	elif self == right_label:
		Global.score_right += Global.score
		print(Global.score_right)
	Global.score = 0
	$"../WinnerSFX".play()
	print("0")
