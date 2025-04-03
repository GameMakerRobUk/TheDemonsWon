function sort_by_distance_and_priority(_inst1, _inst2){
	return ((_inst1.priority * 100000) + _inst1.dist) - ((_inst2.priority * 100000) + _inst2.dist)
}

function sort_by_distance(_inst1, _inst2){
	return _inst1.dist - _inst2.dist;
}

function sort_by_priority(_inst1, _inst2){
	return _inst1.priority - _inst2.priority;
}