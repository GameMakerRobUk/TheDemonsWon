event_inherited();
inventory = {};
add_item(id, new Item("SEED", 0, 0, 1));

update_cell_coords();
has_initialised = false;

item_was_given = function(){
	show_debug_message("Farm plot item was given");
	job.state = FARM_PLOT_STATE.grow;
	plant = instance_create_layer(x, y, layer, parPlant);
}