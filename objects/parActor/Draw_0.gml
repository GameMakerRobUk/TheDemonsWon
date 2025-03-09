draw_self();
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);

draw_text(x, bbox_top, state_debug[state]);
draw_text(x, bbox_top - 20, string(inventory));