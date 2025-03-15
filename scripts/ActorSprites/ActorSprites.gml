function ActorSprites(_sex, _race) constructor{
	
	show_debug_message("ActorSprites");
	show_debug_message("sex: " + string(_sex));
	show_debug_message("_race: " + string(_race));
	
	sprites = {  
				"idle" : {body : -1, hand_items : {},}, 
				"walk" : {body : -1, hand_items : {},},  
				"run" : {body : -1, hand_items : {},},  
				"jump" : {body : -1, hand_items : {},},  
				"fall" : {body : -1, hand_items : {},},  
				"use" : {body : -1, hand_items : {},},  
				"die" : {body : -1, hand_items : {},}, 
			};
	
	var _names = struct_get_names(sprites);
	
	for (var i = 0; i < array_length(_names); i ++){
		var _state = _names[i];
		var _state_struct = {}
		show_debug_message("_state: " + string(_state));
		
		var _state_sprites = struct_get(global.sprites, _state);
		show_debug_message("_state_sprites: " + string(_state_sprites));
		
		var _sex_sprites = struct_get(_state_sprites, _sex);
		show_debug_message("_sex_sprites: " + string(_sex_sprites));
		
		struct_set(_state_struct, "body", _sex_sprites.body[_race]);
		struct_set(_state_struct, "hand_items", _sex_sprites.hand_items);
		struct_set(_state_struct, "image_speed", _state_sprites.image_speed);
		
		struct_set(self, _state, _state_struct);
	}
	
	thinking = idle;
}