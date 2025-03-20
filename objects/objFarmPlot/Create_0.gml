event_inherited();
inventory = {};
add_item(id, new Item("SEED", 0, 0, 1));

update_cell_coords();
has_initialised = false;

item_was_given = function(){
	show_debug_message("objFarmPlot item_was_given");
	
	if (job.plant == noone){
		show_debug_message("There is no plant, creating one")
		job.state = FARM_PLOT_STATE.grow;
		job.plant = instance_create_layer(x, y, layer, parPlant);
		//Lose Seed

		inventory.SEED.wanted = 0;
		remove_item(id, struct_get(inventory, "SEED"));
	}
}

item_was_taken = function(){
	show_debug_message("objFarmPlot item_was_taken");
	inventory = {};
	add_item(id, new Item("SEED", 0, 0, 1));
	weight.update_remaining();
	
	show_debug_message("inventory: " + string(inventory));
	show_debug_message("weight: " + string(weight));
}