window_set_fullscreen(false);

#macro TEST_CANCELLATIONS false

#macro Test_Cancellations:TEST_CANCELLATIONS true

#macro GAME_SPEED game_get_speed(gamespeed_fps)

global.item_stats = {
	LOGS : {weight : 1},
	STONE : {weight : 2},
	SEED : {weight : 1},
}

#region Create Sprites
global.sprites = {
	idle : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1,},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		image_speed : 0.3,
	},
	walk : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		image_speed : 0.8,
	},
	run : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		image_speed : 0.8,
	},
	jump : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		image_speed : 0.3,
	},
	fall : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		image_speed : 0.3,
	},
	use : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		image_speed : 0.3,
	},
	die : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
			clothing : {shirt : [], pants : [], boots : []},
			hair : [],
		},
		image_speed : 0.3,
	},
}
/*
	80x64
	39,63
	5,8,8,4,4,6,10
*/
	var _yframe = 0;

	global.sprites.idle.male.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47);
	global.sprites.idle.male.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); _yframe ++;
	global.sprites.walk.male.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47);
	global.sprites.walk.male.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); _yframe ++;
	global.sprites.run.male.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47);
	global.sprites.run.male.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); _yframe ++;
	global.sprites.jump.male.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47);
	global.sprites.jump.male.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); _yframe ++;
	global.sprites.fall.male.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47);
	global.sprites.fall.male.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); _yframe ++;
	global.sprites.use.male.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); 
	global.sprites.use.male.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); _yframe ++;
	global.sprites.die.male.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47);
	global.sprites.die.male.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 5, 39, 47); _yframe ++;
	
	_yframe = 0;
	
	global.sprites.idle.female.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);
	global.sprites.idle.female.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47); _yframe ++;
	global.sprites.walk.female.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);
	global.sprites.walk.female.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47); _yframe ++;
	global.sprites.run.female.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);
	global.sprites.run.female.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47); _yframe ++;
	global.sprites.jump.female.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);
	global.sprites.jump.female.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47); _yframe ++;
	global.sprites.fall.female.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);
	global.sprites.fall.female.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47); _yframe ++;
	global.sprites.use.female.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);
	global.sprites.use.female.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47); _yframe ++;
	global.sprites.die.female.hand_items.axe_wood = create_sprite(ss_axe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);
	global.sprites.die.female.hand_items.pickaxe_wood = create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, _yframe, 8, 39, 47);

for (var _col = 1; _col <= 5; _col ++){
	//idle
	var _ss_male = asset_get_index("ss_male_" + string(_col));
	array_push(global.sprites.idle.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 0, 5, 39, 47));
	
	var _ss_female = asset_get_index("ss_female_" + string(_col));
	array_push(global.sprites.idle.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 0, 5, 39, 47));
	
	//walk
	array_push(global.sprites.walk.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 1, 8, 39, 47));
	array_push(global.sprites.walk.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 1, 8, 39, 47));

	//Run
	array_push(global.sprites.run.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 2, 8, 39, 47));
	array_push(global.sprites.run.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 2, 8, 39, 47));

	//Jump
	array_push(global.sprites.jump.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 3, 8, 39, 47));
	array_push(global.sprites.jump.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 3, 8, 39, 47));
	
	//Fall
	array_push(global.sprites.fall.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 4, 4, 39, 47));
	array_push(global.sprites.fall.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 4, 4, 39, 47));
	
	//Use
	array_push(global.sprites.use.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 5, 6, 39, 47));
	array_push(global.sprites.use.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 5, 6, 39, 47));
	
	//Die
	array_push(global.sprites.die.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 6, 10, 39, 47));
	array_push(global.sprites.die.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 6, 10, 39, 47));

}

#region

var _state_names = [
	"idle",
	"walk",  
	"run",  
	"jump",  
	"fall",  
	"use",  
	"die", 
];

state_frames = [5,8,8,4,4,6,10]

for (var i = 0; i < 30; i ++){
	var _pants = asset_get_index("ss_male_pants_" + string(i));
	if (_pants != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.male.clothing.pants, create_sprite(_pants, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
	var _shirt = asset_get_index("ss_male_shirt_" + string(i));
	if (_shirt != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.male.clothing.shirt, create_sprite(_shirt, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
	var _boots = asset_get_index("ss_male_boots_" + string(i));
	if (_boots != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.male.clothing.boots, create_sprite(_boots, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
	var _hair = asset_get_index("ss_male_hair_" + string(i));
	if (_hair != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.male.hair, create_sprite(_hair, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
	
	var _pants = asset_get_index("ss_fem_pants_" + string(i));
	if (_pants != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.female.clothing.pants, create_sprite(_pants, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
	var _shirt = asset_get_index("ss_fem_shirt_" + string(i));
	if (_shirt != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.female.clothing.shirt, create_sprite(_shirt, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
	var _boots = asset_get_index("ss_fem_boots_" + string(i));
	if (_boots != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.female.clothing.boots, create_sprite(_boots, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
	var _hair = asset_get_index("ss_fem_hair_" + string(i));
	if (_hair != -1){
		for (var j = 0; j < array_length(_state_names); j ++){
			var _state = _state_names[j];
			var _state_struct = struct_get(global.sprites, _state);
			array_push(_state_struct.female.hair, create_sprite(_hair, 10, 7, 80, 64, j, state_frames[j], 39, 47));
		}
	}
}

#endregion

show_debug_message("global.sprites: " + string(global.sprites));

global.actor_states = { //Not used currently. At some point it might be useful to have an actor have a struct like this, with everything state-related inside it
	"idle" : {},
	"walk" : {},  
	"run" : {},  
	"jump" : {},  
	"fall" : {},  
	"use" : {},  
	"die" : {}, 
	"thinking" : {},
}

#endregion
