extends Spatial
class_name VTOL_Tether, "vtol_icon.png"

# tether pulls a rocket towards it at a fixed length and strength

export(bool) var active := true
export(NodePath) var rocket_node
export(float) var tether_length := 15.0
export(int) var teather_strength := 250

func _ready():
	if not active:
		set_physics_process(false)
		return
	
	rocket_node = get_node(rocket_node)

func _physics_process(_delta):
	assert(rocket_node)
	if not is_instance_valid(rocket_node):
		return 
	var node_pos = rocket_node.get_global_transform().origin
	var my_pos = get_global_transform().origin
	look_at(node_pos,Vector3(0,1,0))
	if my_pos.distance_to(node_pos) > tether_length:
		rocket_node.add_force(-my_pos.direction_to(node_pos)*teather_strength,node_pos-my_pos)
