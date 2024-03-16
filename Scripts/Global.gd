extends Node

var money = 0
var score = 0
var phase = 0
var X = 1
var pressed = false
var revealstate = false
var score_left = 0
var score_right = 0
var transition = 1

func save_game():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"score" : score,
		"phase" : phase,
		"score_left" : score_left,
		"score_right" : score_right,
	}
	return save_dict
