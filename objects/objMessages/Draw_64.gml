draw_set_colour(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _x = 0
var _y = 0;

for (var i = array_length(messages) - 1; i >= 0; i --){
	draw_text(_x, _y, messages[i].text);
	_y += 12;
}