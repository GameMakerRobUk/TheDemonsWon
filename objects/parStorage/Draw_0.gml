event_inherited();
draw_set_halign(fa_left);

var _item_names = struct_get_names(inventory);
for (var i = 0; i < array_length(_item_names); i ++){
	var _item_name = _item_names[i];
	var _item_struct = struct_get(inventory, _item_name);
	draw_text(x, (y - 80) + (i * 16), _item_struct.name + ":" + string(_item_struct.quantity) + "/" + string(_item_struct.wanted));
}

draw_text(x, y - 124, "Weight: " + string(weight.current) + "/" + string(weight.maximum) + "/" + string(weight.remaining));