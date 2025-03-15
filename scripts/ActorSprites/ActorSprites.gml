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
			
	/*
	idle : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1,},
			clothes : {shirt : [], pants : [], boots : []},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothes : {shirt : [], pants : [], boots : []},
		},
		image_speed : 0.3,
	},
	*/
	
	var _names = struct_get_names(sprites);
	
	for (var i = 0; i < array_length(_names); i ++){
		var _state = _names[i];
		var _state_struct = {clothing : {}}
		show_debug_message("_state: " + string(_state));
		
		var _state_sprites = struct_get(global.sprites, _state);
		show_debug_message("_state_sprites: " + string(_state_sprites));
		
		var _sex_sprites = struct_get(_state_sprites, _sex);
		show_debug_message("_sex_sprites: " + string(_sex_sprites));
		
		struct_set(_state_struct, "body", _sex_sprites.body[_race]);
		struct_set(_state_struct, "hand_items", _sex_sprites.hand_items);
		struct_set(_state_struct, "image_speed", _state_sprites.image_speed);
		
		if (i == 0){
			var _pants_index = irandom(array_length(_sex_sprites.clothing.pants) - 1);	
			var _shirt_index = irandom(array_length(_sex_sprites.clothing.shirt) - 1);
			var _boots_index = irandom(array_length(_sex_sprites.clothing.boots) - 1);
			var _hair_index = irandom(array_length(_sex_sprites.hair) - 1);
		}
		
		_state_struct.clothing.pants = _sex_sprites.clothing.pants[_pants_index];
		_state_struct.clothing.shirt = _sex_sprites.clothing.shirt[_shirt_index];
		_state_struct.clothing.boots = _sex_sprites.clothing.boots[_boots_index];
		_state_struct.hair = _sex_sprites.hair[_hair_index];
		
		struct_set(self, _state, _state_struct);
	}
	
	thinking = idle;
}