event_inherited();
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_text(x, bbox_top, state_debug[state]);

//var _item_names = struct_get_names(inventory);
//var _start_y = bbox_top - 64
//for (var i = 0; i < array_length(_item_names); i ++){
//	var _item_name = _item_names[i];
//	var _item_struct = struct_get(inventory, _item_name);
//	draw_text(x, (_start_y) + (i * 16), _item_struct.name + ":" + string(_item_struct.quantity));
//	draw_text(x, _start_y + 16, "WANTED: " + string(_item_struct.wanted));
//	draw_text(x, _start_y + 32, "EXPECTED: " + string(_item_struct.expected));
//}
//var _item_names = struct_get_names(inventory);
//for (var i = 0; i < array_length(_item_names); i ++){
//	var _item_name = _item_names[i];
//	var _item_struct = struct_get(inventory, _item_name);
//	draw_text(x, (y) + (i * 16), _item_struct.name + ":" + string(_item_struct.quantity));
//}