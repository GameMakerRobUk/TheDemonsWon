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
		body : {
			idle : [],walk : [],run : [],jump : [],fall : [],use : [],die : [],
		},
		hand_items : {
			axe_wood : {
				idle : [],walk : [],run : [],jump : [],fall : [],use : [],die : [],
			},
			pickaxe_wood : {
				idle : [],walk : [],run : [],jump : [],fall : [],use : [],die : [],
			},
		}
	},
	female : {
		body : {
			idle : [],walk : [],run : [],jump : [],fall : [],use : [],die : [],
		},
		hand_items : {
			axe_wood : {
				idle : [],walk : [],run : [],jump : [],fall : [],use : [],die : [],
			},
			pickaxe_wood : {
				idle : [],walk : [],run : [],jump : [],fall : [],use : [],die : [],
			},
		}
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
	array_push(global.sprites.male.body.idle, create_sprite(_ss_male, 10, 7, 80, 64, 0, 5, 39, 55));
	
	var _ss_female = asset_get_index("ss_female_" + string(_col));
	array_push(global.sprites.female.body.idle, create_sprite(_ss_female, 10, 7, 80, 64, 0, 5, 39, 55));
	
	//walk
	array_push(global.sprites.male.body.walk, create_sprite(_ss_male, 10, 7, 80, 64, 1, 8, 39, 55));
	array_push(global.sprites.female.body.walk, create_sprite(_ss_female, 10, 7, 80, 64, 1, 8, 39, 55));
	
	//Run
	array_push(global.sprites.male.body.run, create_sprite(_ss_male, 10, 7, 80, 64, 2, 8, 39, 55));
	array_push(global.sprites.female.body.run, create_sprite(_ss_female, 10, 7, 80, 64, 2, 8, 39, 55));
	
	//Jump
	array_push(global.sprites.male.body.jump, create_sprite(_ss_male, 10, 7, 80, 64, 3, 8, 39, 55));
	array_push(global.sprites.female.body.jump, create_sprite(_ss_female, 10, 7, 80, 64, 3, 8, 39, 55));
	
	//Fall
	array_push(global.sprites.male.body.fall, create_sprite(_ss_male, 10, 7, 80, 64, 4, 4, 39, 55));
	array_push(global.sprites.female.body.fall, create_sprite(_ss_female, 10, 7, 80, 64, 4, 4, 39, 55));
	
	//Use
	array_push(global.sprites.male.body.use, create_sprite(_ss_male, 10, 7, 80, 64, 5, 6, 39, 55));
	array_push(global.sprites.female.body.use, create_sprite(_ss_female, 10, 7, 80, 64, 5, 6, 39, 55));
	
	//Die
	array_push(global.sprites.male.body.die, create_sprite(_ss_male, 10, 7, 80, 64, 6, 10, 39, 55));
	array_push(global.sprites.female.body.die, create_sprite(_ss_female, 10, 7, 80, 64, 6, 10, 39, 55));
}

array_push(global.sprites.male.hand_items.axe_wood.idle, create_sprite(ss_axe_wood, 10, 7, 80, 64, 0, 5, 39, 55));
array_push(global.sprites.male.hand_items.axe_wood.walk, create_sprite(ss_axe_wood, 10, 7, 80, 64, 1, 8, 39, 55));
array_push(global.sprites.male.hand_items.axe_wood.run, create_sprite(ss_axe_wood, 10, 7, 80, 64, 2, 8, 39, 55));
array_push(global.sprites.male.hand_items.axe_wood.jump, create_sprite(ss_axe_wood, 10, 7, 80, 64, 3, 8, 39, 55));
array_push(global.sprites.male.hand_items.axe_wood.fall, create_sprite(ss_axe_wood, 10, 7, 80, 64, 4, 4, 39, 55));
array_push(global.sprites.male.hand_items.axe_wood.use, create_sprite(ss_axe_wood, 10, 7, 80, 64, 5, 6, 39, 55));
array_push(global.sprites.male.hand_items.axe_wood.die, create_sprite(ss_axe_wood, 10, 7, 80, 64, 6, 10, 39, 55));

array_push(global.sprites.male.hand_items.pickaxe_wood.idle, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 0, 5, 39, 55));
array_push(global.sprites.male.hand_items.pickaxe_wood.walk, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 1, 8, 39, 55));
array_push(global.sprites.male.hand_items.pickaxe_wood.run, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 2, 8, 39, 55));
array_push(global.sprites.male.hand_items.pickaxe_wood.jump, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 3, 8, 39, 55));
array_push(global.sprites.male.hand_items.pickaxe_wood.fall, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 4, 4, 39, 55));
array_push(global.sprites.male.hand_items.pickaxe_wood.use, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 5, 6, 39, 55));
array_push(global.sprites.male.hand_items.pickaxe_wood.die, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 6, 10, 39, 55));


#endregion