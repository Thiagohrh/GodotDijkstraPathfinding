extends Node

onready var graph = get_node("Graph")
onready var enemy = get_node("Enemy")
#Should detect a click and search for a path as far away from the click as possible. Feed that path to the enemy so that it goes along a path.
func _ready():
	pass

func _input(event):
	# Mouse in viewport coordinates
	if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.global_position)
		var path = graph.get_path_array(enemy.global_position, event.global_position)
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
	#elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
	# Print the size of the viewport
   #print("Viewport Resolution is: ", get_viewport_rect().size)