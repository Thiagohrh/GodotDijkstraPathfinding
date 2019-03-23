extends Position2D

var neighbours = Array()

export (NodePath)var neighbour = null
export (NodePath)var neighbour1 = null
export (NodePath)var neighbour2 = null
export (NodePath)var neighbour3 = null
export (NodePath)var neighbour4 = null
export (NodePath)var neighbour5 = null

var visited = false
var min_distance = 999999

func _ready():
	#Should assemble all the references in the array...
	neighbours.clear()
	assemble_neighbours()
	#print("Im ", name, " and i have ", neighbours.size(), " neighbours!")
	pass

func get_neighbours():
	return neighbours

func check_visited():
	return visited

func set_visited(_bool):
	visited = _bool

func set_min_distance(_dist):
	min_distance = _dist

func get_min_distance():
	return min_distance

func assemble_neighbours():
	if neighbour != null:
		neighbours.push_back(get_node(neighbour))
	if neighbour1 != null:
		neighbours.push_back(get_node(neighbour1))
	if neighbour2 != null:
		neighbours.push_back(get_node(neighbour2))
	if neighbour3 != null:
		neighbours.push_back(get_node(neighbour3))
	if neighbour4 != null:
		neighbours.push_back(get_node(neighbour4))
	if neighbour5 != null:
		neighbours.push_back(get_node(neighbour5))
	pass