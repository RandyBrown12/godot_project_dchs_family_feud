extends MeshInstance3D

static var pressed = true
func _ready():
	self.mesh.text = str(Global.score)

func _process(_delta):
	if Global.pressed == true && self.rotation[1] >= -1.55:
		rotate_y(-0.1)
		pressed = true
	if pressed == true && self.rotation[1] <= -1.55:
		print(self)
		rotate_y(3.1)
		self.mesh.text = str(Global.score)
		Global.pressed = false
		pressed = false
	if self.rotation[1] > 0:
		rotate_y(-0.1)

	
