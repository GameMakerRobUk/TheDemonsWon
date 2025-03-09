draw_set_alpha(0.25);
draw_set_color(c_dkgrey);

var _hcells = floor(room_width / CELL_SIZE);
var _vcells = floor(room_height / CELL_SIZE);

for (var yy = 0; yy < _vcells; yy ++){
	for (var xx = 0; xx < _hcells; xx ++){
		draw_rectangle(xx * CELL_SIZE, yy * CELL_SIZE, (xx * CELL_SIZE) + CELL_SIZE - 1, (yy * CELL_SIZE) + CELL_SIZE - 1, true);
	}
}

draw_set_alpha(1);

draw_set_color(c_black);
draw_text(mouse_x, mouse_y, string(floor(mouse_x / CELL_SIZE)) + "," + string(floor(mouse_y / CELL_SIZE)));