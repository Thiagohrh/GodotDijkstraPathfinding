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
		else:
			print("Returning NULL on situation 2")
		pass
	else:
		print("Returning NULL on situation 1")
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

func dijkstra(_start_node, _end_node):
	#Implementing code as seen in
	#https://www.codingame.com/playgrounds/1608/shortest-paths-with-dijkstras-algorithm/keeping-track-of-paths
	
	#print("The start node is ", _start_node.name, " and the end node is ", _end_node.name)
	#Recieving two nodes, finds a path along the graph made up by the array of all_nodes. Returns an Array() with the path.
	var final_path = Array()
	final_path.clear()
	#A dictionary that's used to keep the shortest path to each KEY
	var shortest_path_to = {}
	shortest_path_to.clear()
	#An array to store the min distances to that final position.
	for i in all_nodes:
		i.set_visited(false)
		i.set_min_distance(99999)
		#Does this work?
		shortest_path_to[i] = Array()
	
	_start_node.set_min_distance(0)
	shortest_path_to[_start_node].append(_start_node)
	
	#print("The shortest path to ", _start_node, " is ", shortest_path_to[_start_node])
	
	var current_node = _start_node
	
	#Loop could probrably start here-----------------------------------------
	var repetition = 0
	
	while repetition <= all_nodes.size() - 1:
		#print("Working with this: " , current_node.name, " node!")
		var neighbours = current_node.get_neighbours()
		for j in neighbours:
			if !j.check_visited():
				var distance_buffer = current_node.get_min_distance() + current_node.global_position.distance_to(j.global_position)
				#print("distance buffer here is...", distance_buffer)
				if distance_buffer < j.get_min_distance():
					j.set_min_distance(distance_buffer)
					shortest_path_to[j].clear()
					#Should iterate trough all of the objects INSIDE this array here...and add them...ok...
					for w in shortest_path_to[current_node]:
						shortest_path_to[j].append(w)
						pass
					shortest_path_to[j].append(j)
					pass
			pass
		current_node.set_visited(true)
		
		#Picking another node, that has not been visited, and has the smallest distance.
		var smallest_distance_so_far = 999999
		var unvisited_smallest_distance = null
		for i in all_nodes:
			if !i.check_visited() and i.get_min_distance() < smallest_distance_so_far:
				smallest_distance_so_far = i.get_min_distance()
				current_node = i
				pass
			pass
		
		
		#print("Chosen node for this repetition is: " , current_node.name)
		repetition += 1
		pass
	
	
	#Lets print all paths to each node shall we?
	#var keys = shortest_path_to.keys()
	#for i in keys:
	#	var values = shortest_path_to[i]
	#	print("The shortest Path to: ", i.name, " is: ")
	#	for j in values:
	#		print(j.name, " then ")
	#		pass
	#	pass
	
	#When its node3 as the destination, it returns an empty array? thats...weird
	
	#for i in all_nodes:
	#	print("Final distances are..." , i.get_min_distance())
	#Finally, to return the array with the positions in order....
	final_path = shortest_path_to[_end_node]
	#print("Is it a problem with path: " , final_path)
	return final_path