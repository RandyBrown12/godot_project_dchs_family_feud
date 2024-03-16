extends Control

var state = false

# Called when the node enters the scene tree for the first time.

func _on_button_pressed():
	if state == false:
		for child in get_children():
			if child is Sprite2D:
				for child2 in child.get_children():
					child2.visible = false
					state = true
	elif state == true:
		for child in get_children():
			if child is Sprite2D:
				for child2 in child.get_children():
					child2.visible = true
					state = false

