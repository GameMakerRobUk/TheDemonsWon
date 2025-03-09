function get_closest_storage(_x, _y){

	var _a = [];
	
	if (instance_number(parStorage) == 0){
		show_debug_message("There are no stores!")
		return undefined;
	}
	
	with parStorage{
		get_distance({x : _x, y : _y});	
		array_push(_a, id);
	}
	
	show_debug_message("_a: " + string(_a))
	
	array_sort(_a, sort_by_distance);

	return array_shift(_a);
}