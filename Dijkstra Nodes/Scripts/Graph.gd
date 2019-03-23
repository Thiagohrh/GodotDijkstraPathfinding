extends Node2D

var all_nodes

var enemy_position
var player_position

func _ready():
	all_nodes = get_node("PositionsHolder").get_children()
	pass

func get_path_array(_enemy_pos, _player_pos):
	#This is a master function that, recieving 2 positions, brings back a path using Dijkstra algorithm.
	#print("Enemy position: " , _enemy_pos, " Click position: ", _player_pos)
	if _player_pos != null:#Just a safety check in order to see if the enemy should run from an enemy or not.
		var starting_pos = find_closest_node(_enemy_pos)
		var destination_pos = find_farthest_node(_player_pos)
		#print("Starting pos is? : " , starting_pos.name)
		#print("Ending pos is? : ", destination_pos.name)
		
		#Here the magic begins....
		if starting_pos != destination_pos:
			return dijkstra(starting_pos, destination_pos)
		pass
	else:
		return null
		pass
	pass

func find_closest_node(_pos):
	#Use this function to know in what node you should start
	var target_node = null
	var closest_distance = 999999999
	
	for i in all_nodes:
		if _pos.distance_to(i.global_position) < closest_distance:
			target_node = i
			closest_distance = _pos.distance_to(i.global_position)
			pass
		pass
	return target_node
	pass

func find_farthest_node(_pos):
	#Use this function to know in what node you should end
	var target_node = null
	var farthest_distance = 0
	
	for i in all_nodes:
		if _pos.distance_to(i.global_position) > farthest_distance:
			target_node = i
			farthest_distance = _pos.distance_to(i.global_position)
			pass
		pass
	return target_node
	pass

func dijkstra(_start_node, _end_node):
	#Recieving two nodes, finds a path along the graph made up by the array of all_nodes. Returns an Array() with the path.
	var final_path = Array()
	
	
	
	return final_path