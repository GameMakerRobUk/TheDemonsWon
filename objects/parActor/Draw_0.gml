draw_self();

if (hand_item.sprite != -1){
	//show_debug_message("drawing hand_item sprite")
	draw_sprite_ext(hand_item.sprite, image_index, x, y, image_xscale, 1, 0, c_white, 1);	
}

draw_set_valign(fa_bottom);
draw_set_halign(fa_center);

if (job != undefined){
	draw_text(x, y, "HAS JOB");
	exit;
}

draw_text(x, y, "NO JOB");
draw_text(x, y + 20, state);