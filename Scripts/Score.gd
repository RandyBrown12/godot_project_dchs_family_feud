extends Label


func _process(delta):
	self.text = str(Global.score)

func _on_button_toggled(toggled_on):
	Global.score += 1
