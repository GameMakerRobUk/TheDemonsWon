event_inherited();
inventory = {};
add_item(id, new Item("SEED", 0, 0, 1));

update_cell_coords();
has_initialised = false;

item_was_given = function(){
	show_debug_message("Farm plot item was given");
	
	if (job.plant == noone){
		job.state = FARM_PLOT_STATE.grow;
		job.plant = instance_create_layer(x, y, layer, parPlant);
		//Lose Seed
		//inventory = {};
		//add_item(id, new Item("SEED", 0, 0, 1));
		inventory.SEED.wanted = 0;
		remove_item(id, struct_get(inventory, "SEED"));
	}
}

item_was_taken = function(){
	show_debug_message("item_was_taken for objFarmPlot");
	inventory = {};
	add_item(id, new Item("SEED", 0, 0, 1));
	weight.update_remaining();
}