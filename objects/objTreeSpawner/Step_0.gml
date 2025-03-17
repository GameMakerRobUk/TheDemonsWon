var _existing_trees = instance_number(objTree);

for (var i = _existing_trees; i < wanted_trees; i ++){
	all_nodes = array_shuffle(all_nodes);
	var _x = all_nodes[0].x;
	var _y = all_nodes[0].y;
	var _attempts = 0;
	
	while (!instance_position(_x, y, objTree)){
		_x = all_nodes[0].x;	
		_y = all_nodes[0].y;
		
		_attempts ++;
		if (_attempts > 20){
			_existing_trees = wanted_trees;
			break;	
		}
	}
	
	//instance_create_layer(_x, _y, "Harvest", objTree, {growth_stage : irandom(3)});	
	instance_create_layer(_x, _y, "Harvest", objTree, {growth_stage : 0});	
}