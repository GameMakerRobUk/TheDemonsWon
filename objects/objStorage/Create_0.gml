event_inherited();
show_debug_message("objStorage inventory: " + string(inventory))
weight = new Weight(100, 0);
add_item(id, new Item("LOGS", 0, 0, 100));
add_item(id, new Item("STONE", 0, 0, 100));


has_initialised = false;

job_was_cancelled = function(_item_struct){
	show_debug_message("objStorage job_was_cancelled")
	show_debug_message("Job was cancelled for a stockpile");
	show_debug_message("hauled_item : _item_struct: " + string(_item_struct));
	show_debug_message("stockpile inventory: " + string(inventory));
	
	var _item_name = _item_struct.name; show_debug_message("_item_name: " + _item_name)
	var _quantity = _item_struct.quantity;
	var _inventory_item = struct_get(inventory, _item_name); show_debug_message("_inventory_item: " + string(_inventory_item))
	var _expected_quantity = _inventory_item.expected;
	
	_inventory_item.expected -= _quantity;
	var _weight_per_unit = get_weight(_item_name);
	weight.current -= (_quantity * _weight_per_unit);
	weight.update_remaining();
	show_debug_message("New inventory: " + string(inventory))
	show_debug_message("objBuilding job_was_cancelled finished")
}
