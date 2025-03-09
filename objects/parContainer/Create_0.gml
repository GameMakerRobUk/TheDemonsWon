weight = new Weight(10, 0);
permanent = true; //If not permanent, and empty, destroy self
inventory = {};
update_cell_coords();

enum CONTAINER_PRIORITY{
	building,
	storage,
}

item_was_taken = function(_item, _quantity){
	show_debug_message("parContainer item_was_taken from " + object_get_name(object_index))
	if (permanent){
		show_debug_message("Container is permanent, exiting")
		return;
	}
	show_debug_message("NOT permanent storage");
	if (_quantity <= 0){
		struct_remove(inventory, _item);
		show_debug_message("No more of " + _item + " left, removing from container")
	}
	if (array_length(struct_get_names(inventory)) == 0){
		show_debug_message("no inventory items left, destroying")
		instance_destroy();	
	}
}

item_was_given = function(){
	show_debug_message("parContainer item_was_given default")	
}