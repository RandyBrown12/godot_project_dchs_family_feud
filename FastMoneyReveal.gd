extends Control

@onready var animation_player = $"../../AnimationPlayer"
var clicked = true
var child = Node
var pressed = 0
var Answer = Node
var AnimButton = Node
var ScoreRev = Node
var score = 0
@onready var label_2 = $"../../UntitledDesign(23)/Label2"

# Called when the node enters the scene tree for the first ti

func _on_fast_money_reveal_pressed():
	if pressed == 0:
		Answer = get_child(0)
		AnimButton = get_child(1)
		ScoreRev = get_child(2)
		$"../../../../ReviewSFX".play()
		Answer.visibility_layer = 1
		AnimButton.visible = true
		animation_player.play(str("buttonslide",str(AnimButton)[0]))
		await animation_player.animation_finished
		AnimButton.play("buttonidle")
		pressed = 1
	elif pressed == 1:
		AnimButton.visible = false
		ScoreRev.visibility_layer = 1
		if int(ScoreRev.text) == 0:
			$"../../../../FastWrongSFX".play()
		elif int(ScoreRev.text) > 0:
			$"../../../../FastRightSFX".play()
		Global.score += (int(ScoreRev.text) * 2)
		label_2.text = str(Global.score)
		
		

	
	


