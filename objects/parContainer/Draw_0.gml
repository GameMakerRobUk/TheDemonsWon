draw_self();
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _names = struct_get_names(inventory);
var _data = struct_get(inventory, _names[0]);

draw_text(x, y, _data.name);
draw_text(x, y + 20, "quantity: " + string(_data.quantity));
draw_text(x, y + 40, "wanted: " + string(_data.wanted));
draw_text(x, y + 60, "expected: " + string(_data.expected));
