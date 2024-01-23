extends Node2D

const screen_width = 512
const screen_height = 512
# Assuming MAIN_WINDOW_ID represents the main window
const MAIN_WINDOW_ID = DisplayServer.MAIN_WINDOW_ID

func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED, MAIN_WINDOW_ID)
	DisplayServer.window_set_size(Vector2(screen_width, screen_height), MAIN_WINDOW_ID)
	

func _input(event):
	#check fullscreen resize - modified from GD script 3 where OS.resize would not alter the resolution.
	
	if event is InputEventKey and event.pressed and event.keycode == KEY_F:
		if DisplayServer.window_get_mode(MAIN_WINDOW_ID) == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED, MAIN_WINDOW_ID)
			DisplayServer.window_set_size(Vector2(screen_width, screen_height), MAIN_WINDOW_ID)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN, MAIN_WINDOW_ID)
			DisplayServer.window_set_size(Vector2(screen_width * 2, screen_height * 2), MAIN_WINDOW_ID)
	# check quit and restart
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()
	
	# DEBUG
	
	# Print node hierarchy with P
	if event is InputEventKey and event.pressed and event.keycode == KEY_P:
		print(get_node_hierarchy(get_tree().get_root()))

func get_node_hierarchy(node: Node, indent_level: int = 0) -> String:
	var hierarchy: String = ""
	for child in node.get_children():
		hierarchy += "\t".repeat(indent_level) + child.get_name() + " (" + child.get_class() + ")\n"
		if child.get_child_count() > 0:
			hierarchy += get_node_hierarchy(child, indent_level + 1)
	return hierarchy
