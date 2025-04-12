function sort_by_distance_and_priority(_inst1, _inst2){
	//if (_inst1.type == "HAUL_ITEM"){
	//	show_debug_message("_inst1.priority: " + object_get_name(_inst1.deliver_to.object_index));
	//	show_debug_message("_inst2.priority: " + object_get_name(_inst2.deliver_to.object_index));
	//	show_debug_message("_inst1.priority: " + string(_inst1.priority));
	//	show_debug_message("_inst2.priority: " + string(_inst2.priority));
	//}
	//return ((_inst2.priority * 100000) + _inst2.dist) - ((_inst1.priority * 100000) + _inst1.dist)
	//var _p = (_inst2.priority * 100000) - (_inst1.priority * 100000);
	//var _dis = _inst1.dist - _inst2.dist;
	
	if (_inst2.priority * 100000) != (_inst1.priority * 100000){
		return 	_inst2.priority - _inst1.priority;
	}
	
	return _inst1.dist - _inst2.dist;
}

function sort_by_distance(_inst1, _inst2){
	return _inst1.dist - _inst2.dist;
}

function sort_by_priority(_inst1, _inst2){
	//if (_inst1.type == "HAUL_ITEM"){
	//	show_debug_message("_inst1.priority: " + object_get_name(_inst1.deliver_to.object_index));
	//	show_debug_message("_inst2.priority: " + object_get_name(_inst2.deliver_to.object_index));
	//	show_debug_message("_inst1.priority: " + string(_inst1.priority));
	//	show_debug_message("_inst2.priority: " + string(_inst2.priority));
	//}
	return _inst2.priority - _inst1.priority;
}