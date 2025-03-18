function Item (_name, _quantity = 0, _expected = 0, _wanted = 0) constructor{
	name = _name;
	quantity = _quantity;
	expected = _expected;
	wanted = _wanted;
	
	show_debug_message("new Item created: " + string({name : name, quantity : quantity, expected : expected, wanted : wanted}))
}

function update_inventory(_inventory, _item_struct){
	show_debug_message("update_inventory");
	show_debug_message("inventory previous: " + string(_inventory))
	struct_set(_inventory, _item_struct.name, new Item(_item_struct.name, 
						   _item_struct.quantity, 
						   _item_struct.expected,
						   _item_struct.wanted));
						   
	show_debug_message("inventory after: " + string(_inventory))
}

function add_item(_receiver, _item_struct){
	show_debug_message("add_item");
	show_debug_message("_receiver: " + object_get_name(_receiver.object_index));
	show_debug_message("_item_struct: " + string(_item_struct));
	
	var _inventory = _receiver.inventory;
	
	//Check to see if there's no entry for this item in receivers inventory
	if (struct_get(_inventory, _item_struct.name) == undefined){
		update_inventory(_inventory, _item_struct);
		exit;
	}
	
	var _inventory_struct = struct_get(_inventory, _item_struct.name);
	show_debug_message("_inventory: " + string(_inventory))
	show_debug_message("_inventory_struct: " + string(_inventory_struct))
	
	var _existing_quantity = _inventory_struct.quantity;//struct_get(_inventory, _item_struct.name);
	show_debug_message("_existing_quantity: " + string(_existing_quantity))
	
	var _quantity = _item_struct.quantity;
	show_debug_message("_quantity: " + string(_quantity))
		
	_existing_quantity = _existing_quantity == undefined? 0 : _existing_quantity;
		
	var _new_quantity = _existing_quantity + _quantity;
	show_debug_message("_new_quantity: " + string(_new_quantity))
	_inventory_struct.quantity = _new_quantity;
	
	if (_item_struct.quantity == 0) 
		exit;
	
	_receiver.item_was_given(_item_struct.name, _new_quantity);
}

function remove_item(_store, _item_struct){
	show_debug_message("remove_item");
	show_debug_message("_item_struct: " + string(_item_struct))

	var _inventory = _store.inventory;
	var _item = _item_struct.name;

	var _wanted_quantity = _item_struct.quantity;
	var _inventory_struct = struct_get(_inventory, _item);
	var _existing_quantity = _inventory_struct.quantity;
	_existing_quantity = _existing_quantity == undefined? 0 : _existing_quantity;
	var _new_quantity = max(0, _existing_quantity - _wanted_quantity);
	
	show_debug_message("_existing_quantity: " + string(_existing_quantity))
	show_debug_message("_wanted_quantity: " + string(_wanted_quantity))
	show_debug_message("_new_quantity: " + string(_new_quantity))
		
	struct_set(_inventory_struct, "quantity", _new_quantity);
	struct_set(_item_struct, "quantity", min(_existing_quantity, _wanted_quantity));

	_store.item_was_taken(_item, _new_quantity);
	
	show_debug_message("remove_item done, new item_struct: " + string(_item_struct));
	
	return _item_struct; //can only return 5 logs, even when wanted is 10
}

function pickup(_item_struct, _store, _taker){
	show_debug_message("pickup");
	show_debug_message("_item_struct: " + string(_item_struct))
	show_debug_message("store: " + string(_store));
	
	_item_struct = remove_item(_store, _item_struct);
	add_item(_taker, _item_struct);
	
	show_debug_message("pickup done | _item_struct: " + string(_item_struct) + " | _taker inv: " + string(_taker.inventory))
}

function get_weight(_item_name){
	var _item_data = struct_get(global.item_stats, _item_name);
	if (_item_data == undefined){
		show_debug_message("_item_data for " + _item_name + " is undefined");
		return 1;
	}
	
	var _weight = struct_get(_item_data, "weight");
	if (_weight == undefined){
		show_debug_message("_weight for " + _item_name + " is undefined");
		return 1;
	}
	
	return _weight;
}