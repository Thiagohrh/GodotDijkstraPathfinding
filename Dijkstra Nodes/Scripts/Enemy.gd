extends Area2D

func move_along_path(_path):
	for i in _path:
		$Tween.interpolate_property(self,global_position,global_position,i.global_position,3,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,0)
		$Tween.start()
		yield($Tween, "tween_completed")
		pass
	pass