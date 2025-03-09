function set_node_parents(_start){
	show_debug_message("set_node_parents")
	var _open = ds_priority_create();
	var _closed = [];
	var _current = global.nodes[_start.cell_x][_start.cell_y];
	ds_priority_add(_open, _current, 0);
	_current.dist = 0;
	
	while (ds_priority_size(_open) > 0){
		var _node = ds_priority_delete_min(_open); 
		var _neighbour_dist = _node.dist + 1;
		array_push(_closed, _node);
		
		//show_debug_message("_node: " + string(_node))

		//Get the neighbours
		for (var i = 0; i < array_length(_node.neighbours); i ++){
			var _neighbour = _node.neighbours[i];
			var _in_open = ds_priority_find_priority(_open, _neighbour);
			
			if ( (_in_open == undefined && array_get_index(_closed, _neighbour) == -1) ){
				//First time seeing this node
				_neighbour.parent = _node;
				_neighbour.dist = _neighbour_dist;

				ds_priority_add(_open, _neighbour, _neighbour_dist);
			}else{
				if (_neighbour_dist < _neighbour.dist){
					_neighbour.parent = _node;
					_neighbour.dist = _neighbour_dist;
					ds_priority_change_priority(_open, _neighbour, _neighbour_dist);
				}
			}
		}
	}
	
	ds_priority_destroy(_open);
}