function ActorState(_sex, _race) constructor{
	states = {  
				"idle" : {sprites : {body : -1, hand_items : {},}}, 
				"walk" : {sprites : {body : -1, hand_items : {},}},  
				"run" : {sprites : {body : -1, hand_items : {},}},  
				"jump" : {sprites : {body : -1, hand_items : {},}},  
				"fall" : {sprites : {body : -1, hand_items : {},}},  
				"use" : {sprites : {body : -1, hand_items : {},}},  
				"die" : {sprites : {body : -1, hand_items : {},}}, 
			};
	
	var _names = struct_get_names(states);
	
	for (var i = 0; i < array_length(_names); i ++){
		var _state = struct_get(states, _names[i]);
		var _sex_sprites = struct_get(global.sprites, _sex);
		
		struct_set(_state, sprites.body, _sex_sprites.body[_race]);
		struct_set(_state, sprites.hand_items, _sex_sprites.hand_items);
	}
}