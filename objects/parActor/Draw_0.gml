draw_self();
var _clothing = struct_get(sprites, state).clothing;

draw_sprite_ext(_clothing.boots, image_index, x, y, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(_clothing.pants, image_index, x, y, image_xscale, 1, 0, c_white, 1);		
draw_sprite_ext(_clothing.shirt, image_index, x, y, image_xscale, 1, 0, c_white, 1);	
draw_sprite_ext(struct_get(sprites, state).hair, image_index, x, y, image_xscale, 1, 0, c_white, 1);

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