extends Node2D

@onready var left_label = $Left_Label
@onready var right_label = $Right_Label
var score = 0




func _on_left_label_pressed():
	Global.score_left += (Global.score)
	print(Global.score_left)
	left_label.visible = false
	Global.score = 0


func _on_right_label_pressed():
	Global.score_right += (Global.score)
	print(Global.score_right)
	right_label.visible = false
	Global.score = 0
