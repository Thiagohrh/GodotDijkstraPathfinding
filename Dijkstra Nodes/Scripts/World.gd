extends Node

onready var graph = get_node("Graph")
onready var enemy = get_node("Enemy")
#Should detect a click and search for a path as far away from the click as possible. Feed that path to the enemy so that it goes along a path.
func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_mouse_left_click"):
		
		var path = graph.get_path_array(enemy.global_position, get_viewport().get_mouse_position())
		enemy.move(path)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	pass