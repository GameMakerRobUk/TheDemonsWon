job = undefined;

item_was_given = function(){
	show_debug_message("item_was_given objBuilding");
	//Do we have enough resources? Build, otherwise set alarm
	var _has_all_resources = true;
	
	var _item_names = struct_get_names(inventory);
	
	for (var i = 0; i < array_length(_item_names); i ++){
		var _item_name = _item_names[i];
		var _item_struct = struct_get(inventory, _item_name);
		show_debug_message("_item_name: " + string(_item_name));
		show_debug_message("_item_struct: " + string(_item_struct));
		
		var _quantity_wanted = _item_struct.wanted;
		var _quantity_held = _item_struct.quantity;
		
		show_debug_message("_quantity_held: " + string(_quantity_held))
		_quantity_held = _quantity_held == undefined? 0 : _quantity_held;
		
		if (_quantity_held < _quantity_wanted){
			show_debug_message("_quantity_held < _quantity_wanted. Still lacking resources")
			_has_all_resources = false;	
			break;
		}
	}
	
	if (_has_all_resources){
		show_debug_message("Has enough resources. Can now build!");
		show_debug_message("inventory: " + string(inventory))
		//Remove Haul job
		var _pos = array_get_index(global.persistent_jobs, job);
		array_delete(global.persistent_jobs, _pos, 1);
		job = new BuildManager(id);
		array_push(global.persistent_jobs, job);
	}
}

building_finished = function(){
	show_debug_message("building_finished running");
	var _pos = array_get_index(global.persistent_jobs, job);
	array_delete(global.persistent_jobs, _pos, 1);
}

job_was_cancelled = function(_item_struct){
	show_debug_message("objBuilding job_was_cancelled")
	show_debug_message("Job was cancelled for a building");
	show_debug_message("hauled_item : _item_struct: " + string(_item_struct));
	show_debug_message("building inventory: " + string(inventory));
	
	var _item_name = _item_struct.name; show_debug_message("_item_name: " + _item_name)
	var _quantity = _item_struct.quantity;
	var _inventory_item = struct_get(inventory, _item_name); show_debug_message("_inventory_item: " + string(_inventory_item))
	var _expected_quantity = _inventory_item.expected;
	
	_inventory_item.expected -= _quantity;
	weight.current -= _quantity;
	weight.update_remaining();
	show_debug_message("New inventory: " + string(inventory))
	show_debug_message("objBuilding job_was_cancelled finished")
}

inventory = {};
add_item(id, new Item("LOGS", 0, 0, 20));

show_debug_message("Building inventory: " + string(inventory))

hp = 0;
hp_max = 20;
weight = new Weight(20, 0);

update_cell_coords();

has_initialised = false;

