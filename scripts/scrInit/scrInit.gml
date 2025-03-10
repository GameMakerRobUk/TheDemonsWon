window_set_fullscreen(false);

#macro TEST_CANCELLATIONS false

#macro Test_Cancellations:TEST_CANCELLATIONS true

global.item_stats = {
	LOGS : {weight : 1},
	STONE : {weight : 2},
}

#region Create Sprites
global.sprites = {
	male : {
		idle : [],
		walk : [],
		run : [],
		jump : [],
		fall : [],
		use : [],
		die : [],
	},
	female : {
		idle : [],
		walk : [],
		run : [],
		jump : [],
		fall : [],
		use : [],
		die : [],
	}
}
/*
	80x64
	39,63
	5,8,8,4,4,6,10
*/

for (var _col = 1; _col <= 5; _col ++){
	//idle
	var _ss_male = asset_get_index("ss_male_" + string(_col));
	array_push(global.sprites.male.idle, create_sprite(_ss_male, 10, 7, 80, 64, 0, 5, 39, 55));
	
	var _ss_female = asset_get_index("ss_female_" + string(_col));
	array_push(global.sprites.female.idle, create_sprite(_ss_female, 10, 7, 80, 64, 0, 5, 39, 55));
	
	//walk
	array_push(global.sprites.male.walk, create_sprite(_ss_male, 10, 7, 80, 64, 1, 8, 39, 55));
	array_push(global.sprites.female.walk, create_sprite(_ss_female, 10, 7, 80, 64, 1, 8, 39, 55));
	
	//Run
	array_push(global.sprites.male.run, create_sprite(_ss_male, 10, 7, 80, 64, 2, 8, 39, 55));
	array_push(global.sprites.female.run, create_sprite(_ss_female, 10, 7, 80, 64, 2, 8, 39, 55));
	
	//Jump
	array_push(global.sprites.male.jump, create_sprite(_ss_male, 10, 7, 80, 64, 3, 8, 39, 55));
	array_push(global.sprites.female.jump, create_sprite(_ss_female, 10, 7, 80, 64, 3, 8, 39, 55));
	
	//Fall
	array_push(global.sprites.male.fall, create_sprite(_ss_male, 10, 7, 80, 64, 4, 4, 39, 55));
	array_push(global.sprites.female.fall, create_sprite(_ss_female, 10, 7, 80, 64, 4, 4, 39, 55));
	
	//Use
	array_push(global.sprites.male.use, create_sprite(_ss_male, 10, 7, 80, 64, 5, 6, 39, 55));
	array_push(global.sprites.female.use, create_sprite(_ss_female, 10, 7, 80, 64, 5, 6, 39, 55));
	
	//Die
	array_push(global.sprites.male.die, create_sprite(_ss_male, 10, 7, 80, 64, 6, 10, 39, 55));
	array_push(global.sprites.female.die, create_sprite(_ss_female, 10, 7, 80, 64, 6, 10, 39, 55));
}

#endregion