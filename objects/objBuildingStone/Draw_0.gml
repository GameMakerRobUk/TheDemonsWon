draw_self();
draw_set_color(c_black);
var _item_names = struct_get_names(inventory);
var _start_y = bbox_top - 48
for (var i = 0; i < array_length(_item_names); i ++){
	var _item_name = _item_names[i];
	var _item_struct = struct_get(inventory, _item_name);
	draw_text(x, (_start_y) + (i * 16), _item_struct.name + ":" + string(_item_struct.quantity) + " | " + string(_item_struct.wanted) + " | " + string(_item_struct.expected));
}
draw_text(x, _start_y - 16, string(hp) + "/" + string(hp_max));
//draw_text(x, y + 20, string(hp));