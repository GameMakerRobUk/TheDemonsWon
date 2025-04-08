function get_closest_storage(_item_name, _deliver_to = noone){
	show_debug_message("get_closest_storage");
	
	var _available_stores = [];
	
	//Find a store with the wanted resource
	with parStorage{
				
		if (id == _deliver_to){
			continue;	
		}
		var _store_item_struct = struct_get(inventory, _item_name);
		if (_store_item_struct != undefined && _store_item_struct.quantity > 0){
			get_distance(_deliver_to);
			array_push(_available_stores, id);	
		}
	}
			
	with parItem{
		show_debug_message(object_get_name(object_index))
		if (claimed){
			show_debug_message(string(id) + " is already claimed, cannot set as store")
			continue;
		}
				
		var _store_item_struct = struct_get(inventory, _item_name);
		show_debug_message("_store_item_struct: " + string(_store_item_struct));
		if (_store_item_struct != undefined && _store_item_struct.quantity > 0){
			show_debug_message("store has the item and has a quantity > 0")
			get_distance(_deliver_to);
			array_push(_available_stores, id);	
		}	
	}
			
	if (array_length(_available_stores) == 0){
		show_debug_message("get_closest_storage no available stores")
		return noone;	
	}
	
	//Get closest store to place that has the item
	array_sort(_available_stores, sort_by_distance);
			
	var _storage = array_shift(_available_stores);
	show_debug_message("_storage: " + string(_storage));
			
	if (object_get_parent(_storage.object_index) == parItem){
		show_debug_message("parent is parItem");
		_storage.claimed = true;
	}
	
	return _storage;
			
	//var _a = [];
	
	//if (instance_number(parStorage) == 0){
	//	show_debug_message("There are no stores!")
	//	return undefined;
	//}
	
	//with parStorage{
	//	get_distance({x : _x, y : _y});	
	//	array_push(_a, id);
	//}
	
	//show_debug_message("_a: " + string(_a))
	
	//array_sort(_a, sort_by_distance);

	//return array_shift(_a);
}