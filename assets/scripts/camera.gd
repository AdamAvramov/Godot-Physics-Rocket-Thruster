extends Camera

func _process(_delta):
	look_at(get_parent().get_node("Rocket").transform.origin,Vector3(0,1,0))
