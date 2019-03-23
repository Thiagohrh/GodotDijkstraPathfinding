extends Area2D

func move(_path):
	if _path == null:
		print("WHAT THE FUCK IS GOIN ON")
		pass
	else:
		print("I can work with this...")
		if _path.size() == 0:
			print("JUST KIDDING I CANT")
	for i in _path:
		$Tween.interpolate_property(self, "global_position", global_position ,i.global_position,1,Tween.TRANS_LINEAR,Tween.EASE_IN,0)
		$Tween.start()
		yield($Tween, "tween_completed")
		#print("COMPLETED STEP")
		pass
	pass