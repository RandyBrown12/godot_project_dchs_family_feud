extends Node2D

@onready var _SubWindow: Window = get_window()
@onready var _MainWindow: Window = $Window


func _ready():
	_SubWindow.world_2d = _MainWindow.world_2d
	print(_SubWindow)
