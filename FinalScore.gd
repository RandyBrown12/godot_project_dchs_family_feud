extends Control


func _process(delta):
		$".".text = str(Global.score_right)

func _input(ev):
	if Input.is_key_pressed(KEY_KP_3):
		$"../Untitled(3840X1080Px)".visible = true
		$"../Button".visible = true
		$".".visible = true
		$"../left_label".visible = true
