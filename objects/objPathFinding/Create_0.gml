global.nodes = [];
#macro CELL_SIZE 16

//Create Nodes
var _lay_id = layer_get_id("Collision");
map_id = layer_tilemap_get_id(_lay_id);

w = ceil(room_width / CELL_SIZE);
h = ceil(room_height / CELL_SIZE);

show_debug_message("w: " + string(w));
show_debug_message("h: " + string(h));

for (var yy = 0; yy < h; yy ++){
	for (var xx = 0; xx < w; xx ++){
		global.nodes[xx][yy] = noone;
		var _tile = tilemap_get(map_id, xx, yy);
		
		switch _tile{
			case 1 :{
				instance_create_layer(xx * CELL_SIZE, (yy - 1) * CELL_SIZE, "Nodes", objNode)
			}break;
			case 2 :{
				instance_create_layer(xx * CELL_SIZE, (yy - 1) * CELL_SIZE, "Nodes", objNode)
			}break;
			case 3 :{
				instance_create_layer(xx * CELL_SIZE, (yy - 1) * CELL_SIZE, "Nodes", objNode)
			}break;
		}	
	}
}

with objNode{
	update_cell_coords();
	//show_debug_message("node cell coords: " + string(cell_x) + "," + string(cell_y))
	global.nodes[cell_x][cell_y] = id;
	
	//Neighbours
	neighbours = [];
	var _list = ds_list_create();
	
	collision_circle_list(x + (CELL_SIZE/2), y + (CELL_SIZE/2), CELL_SIZE, objNode, false, true, _list, false);
	for (var i = 0; i < ds_list_size(_list); i ++){
		array_push(neighbours, _list[| i]);	
	}
}