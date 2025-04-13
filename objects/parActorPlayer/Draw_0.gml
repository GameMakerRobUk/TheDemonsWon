event_inherited();
var _clothing = struct_get(sprites, state).clothing;

draw_sprite_ext(_clothing.boots, image_index, x, y, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(_clothing.pants, image_index, x, y, image_xscale, 1, 0, c_white, 1);		
draw_sprite_ext(_clothing.shirt, image_index, x, y, image_xscale, 1, 0, c_white, 1);	
draw_sprite_ext(struct_get(sprites, state).hair, image_index, x, y, image_xscale, 1, 0, c_white, 1);

if (hand_item.sprite != -1){
	//show_debug_message("drawing hand_item sprite")
	draw_sprite_ext(hand_item.sprite, image_index, x, y, image_xscale, 1, 0, c_white, 1);	
}