//Sprites
if (state == ACTOR_STATE.moving){
	if (sprite_index != sprites.walk[race]){
		sprite_index = sprites.walk[race]	
		image_speed = 0.8;
	}
}
if (state == ACTOR_STATE.idle){
	if (sprite_index != sprites.idle[race]){
		sprite_index = sprites.idle[race];
		image_speed = 0.3;
	}
}
if (state == ACTOR_STATE.working){
	if (sprite_index != sprites.use[race]){
		sprite_index = sprites.use[race];
		image_speed = 0.3;
	}
}
if (state == ACTOR_STATE.thinking){
	if (sprite_index != sprites.idle[race]){
		sprite_index = sprites.idle[race];
		image_speed = 0.3;
	}
}