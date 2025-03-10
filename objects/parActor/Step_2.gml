//Sprites
if (state == ACTOR_STATE.moving){
	if (sprite_index != sprites.body.walk[race]){
		sprite_index = sprites.body.walk[race]	
		image_speed = 0.8;
	}
}
if (state == ACTOR_STATE.idle){
	if (sprite_index != sprites.body.idle[race]){
		sprite_index = sprites.body.idle[race];
		image_speed = 0.3;
	}
}
if (state == ACTOR_STATE.working){
	if (sprite_index != sprites.body.use[race]){
		sprite_index = sprites.body.use[race];
		image_speed = 0.3;
	}
}
if (state == ACTOR_STATE.thinking){
	if (sprite_index != sprites.body.idle[race]){
		sprite_index = sprites.body.idle[race];
		image_speed = 0.3;
	}
}

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