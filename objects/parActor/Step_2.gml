//Sprites
//show_debug_message("state: " + string(state));
//show_debug_message("sprites: " + string(sprites))
var _state_sprites = struct_get(sprites, state);

//show_debug_message("_state_sprites: " + string(_state_sprites));

if (sprite_index != _state_sprites.body){
	sprite_index = _state_sprites.body;
	image_speed = _state_sprites.image_speed;
}
//show_debug_message("hand_item: " + string(hand_item));
//show_debug_message("_state_sprites.hand_items: " + string(_state_sprites.hand_items))
if (hand_item.name != undefined && hand_item.sprite != struct_get(_state_sprites.hand_items, hand_item.name)){
	hand_item.sprite = struct_get(_state_sprites.hand_items, hand_item.name);
	show_debug_message("setting hand_item sprites to " + string(hand_item.sprite))
}

//if (state == ACTOR_STATE.moving){
//	if (sprite_index != sprites.body.walk[race]){
//		sprite_index = sprites.body.walk[race]	
//		image_speed = 0.8;
//	}
//}
//if (state == ACTOR_STATE.idle){
//	if (sprite_index != sprites.body.idle[race]){
//		sprite_index = sprites.body.idle[race];
//		image_speed = 0.3;
//	}
//}
//if (state == ACTOR_STATE.working){
//	if (sprite_index != sprites.body.use[race]){
//		sprite_index = sprites.body.use[race];
//		image_speed = 0.3;
//	}
//}
//if (state == ACTOR_STATE.thinking){
//	if (sprite_index != sprites.body.idle[race]){
//		sprite_index = sprites.body.idle[race];
//		image_speed = 0.3;
//	}
//}

//if (job != undefined){
//	var _required_item = variable_instance_get(job.target, "required_item");
//	switch _required_item{
//		case "axe":{
//			hand_item_sprites = sprites.hand_items.axe_wood;	
//		}; break;
//		case "pickaxe":{
//			hand_item_sprites = sprites.hand_items.pickaxe_wood;	
//		}; break;
//		default : {
//			hand_item_sprites = -1;	
//		}
//	}
//}