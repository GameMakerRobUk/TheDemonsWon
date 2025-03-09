if (keyboard_check_pressed(vk_space)){
	all_nodes = array_shuffle(all_nodes);
	var _node = all_nodes[0];
	instance_create_layer(_node.x, _node.y, "Resource", objLog);	
}