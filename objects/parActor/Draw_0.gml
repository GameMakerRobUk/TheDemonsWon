draw_self();

if (hand_item != -1){
	draw_sprite_ext(hand_item_sprites, image_index, x, y, image_xscale, 1, 0, c_white, 1);	
}

draw_set_valign(fa_bottom);
draw_set_halign(fa_center);

draw_text(x, bbox_top, state_debug[state]);
draw_text(x, bbox_top - 20, string(inventory));