extends Node

var current_room = null
var roomA = load("res://FamilyFeud.tscn")
var roomB = load("res://FastMoney.tscn")
var ifroomA = true
var ifroomB = false


func change_room(room_scene : PackedScene):
	var new_room = room_scene.instantiate()
	add_child(new_room)
	if current_room:
		await get_tree().create_timer(0.5).timeout
		current_room.queue_free()
		print("test1")
		await("tree_exited")
	current_room = new_room
	print(current_room)
	print(new_room)

func _input(ev):
	if Input.is_key_pressed(KEY_KP_1) && (Global.phase == 0 || (Global.money == 1 && Global.phase == 2)):
		$"../IntroSFX".play()
		$"../EagleFeud2024".visible = false
		Global.phase += 1
		Global.score = 0
		Global.pressed = false
		Global.revealstate = false
		Global.transition = 1
		change_room(roomA)
	if Input.is_key_pressed(KEY_KP_2) && (Global.money == 0 || (Global.phase == 4 && Global.money == 1)):
		$"../IntroSFX".play()
		Global.money += 1
		Global.score = 0
		Global.pressed = false
		Global.revealstate = false
		Global.transition = 2
		change_room(roomB)
	if Input.is_key_pressed(KEY_KP_7):
		$"../TransitionSFX".play()
	if Input.is_key_pressed(KEY_KP_8):
		$"../IntroSFX".play()
	if Input.is_key_pressed(KEY_KP_9):
		$"../Main".play()


func load_game():
	if not FileAccess.file_exists("user://" + name + ".save"):
		return # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_file = FileAccess.open("user://" + name + ".save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		var node_data = json.get_data()

		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])

func save_game():
	var save_file = FileAccess.open("user://" + name + ".save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)

		# Store the save dictionary as a new line in the save file.
		save_file.store_line(json_string)

