window_set_fullscreen(false);

#macro TEST_CANCELLATIONS false

#macro Test_Cancellations:TEST_CANCELLATIONS true

global.item_stats = {
	LOGS : {weight : 1},
	STONE : {weight : 2},
}

#region Create Sprites
global.sprites = {
	idle : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1,},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
	},
	walk : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
	},
	run : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
	},
	jump : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
	},
	fall : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
	},
	use : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
	},
	die : {
		male : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
		female : {
			body : [], hand_items : {axe_wood : -1, pickaxe_wood : -1},
		},
	},
}
/*
	80x64
	39,63
	5,8,8,4,4,6,10
*/

for (var _col = 1; _col <= 5; _col ++){
	//idle
	var _ss_male = asset_get_index("ss_male_" + string(_col));
	array_push(global.sprites.idle.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 0, 5, 39, 55));
	array_push(global.sprites.idle.male.hand_items.axe_wood, create_sprite(ss_axe_wood, 10, 7, 80, 64, 0, 5, 39, 55));
	array_push(global.sprites.idle.male.hand_items.pickaxe_wood, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 0, 5, 39, 55));
	
	var _ss_female = asset_get_index("ss_female_" + string(_col));
	array_push(global.sprites.idle.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 0, 5, 39, 55));
	
	//walk
	array_push(global.sprites.walk.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 1, 8, 39, 55));
	array_push(global.sprites.walk.male.hand_items.axe_wood, create_sprite(ss_axe_wood, 10, 7, 80, 64, 1, 8, 39, 55));
	array_push(global.sprites.walk.male.hand_items.pickaxe_wood, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 1, 8, 39, 55));
	
	array_push(global.sprites.walk.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 1, 8, 39, 55));
	
	//Run
	array_push(global.sprites.run.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 2, 8, 39, 55));
	array_push(global.sprites.run.male.hand_items.axe_wood, create_sprite(ss_axe_wood, 10, 7, 80, 64, 2, 8, 39, 55));
	array_push(global.sprites.run.male.hand_items.pickaxe_wood, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 2, 8, 39, 55));
	
	array_push(global.sprites.run.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 2, 8, 39, 55));
	
	//Jump
	array_push(global.sprites.jump.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 3, 8, 39, 55));
	array_push(global.sprites.jump.male.hand_items.axe_wood, create_sprite(ss_axe_wood, 10, 7, 80, 64, 3, 8, 39, 55));
	array_push(global.sprites.jump.male.hand_items.pickaxe_wood, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 3, 8, 39, 55));
	
	array_push(global.sprites.jump.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 3, 8, 39, 55));
	
	//Fall
	array_push(global.sprites.fall.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 4, 4, 39, 55));
	array_push(global.sprites.fall.male.hand_items.axe_wood, create_sprite(ss_axe_wood, 10, 7, 80, 64, 4, 4, 39, 55));
	array_push(global.sprites.fall.male.hand_items.pickaxe_wood, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 4, 4, 39, 55));
	
	array_push(global.sprites.fall.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 4, 4, 39, 55));
	
	//Use
	array_push(global.sprites.use.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 5, 6, 39, 55));
	array_push(global.sprites.use.male.hand_items.axe_wood, create_sprite(ss_axe_wood, 10, 7, 80, 64, 5, 6, 39, 55));
	array_push(global.sprites.use.male.hand_items.pickaxe_wood, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 5, 6, 39, 55));
	
	array_push(global.sprites.use.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 5, 6, 39, 55));
	
	//Die
	array_push(global.sprites.die.male.body, create_sprite(_ss_male, 10, 7, 80, 64, 6, 10, 39, 55));
	array_push(global.sprites.die.male.hand_items.axe_wood, create_sprite(ss_axe_wood, 10, 7, 80, 64, 6, 10, 39, 55));
	array_push(global.sprites.die.male.hand_items.pickaxe_wood, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 6, 10, 39, 55));
	
	array_push(global.sprites.die.female.body, create_sprite(_ss_female, 10, 7, 80, 64, 6, 10, 39, 55));
}

//array_push(global.sprites.male.hand_items.axe_wood.idle, create_sprite(ss_axe_wood, 10, 7, 80, 64, 0, 5, 39, 55));
//array_push(global.sprites.male.hand_items.axe_wood.walk, create_sprite(ss_axe_wood, 10, 7, 80, 64, 1, 8, 39, 55));
//array_push(global.sprites.male.hand_items.axe_wood.run, create_sprite(ss_axe_wood, 10, 7, 80, 64, 2, 8, 39, 55));
//array_push(global.sprites.male.hand_items.axe_wood.jump, create_sprite(ss_axe_wood, 10, 7, 80, 64, 3, 8, 39, 55));
//array_push(global.sprites.male.hand_items.axe_wood.fall, create_sprite(ss_axe_wood, 10, 7, 80, 64, 4, 4, 39, 55));
//array_push(global.sprites.male.hand_items.axe_wood.use, create_sprite(ss_axe_wood, 10, 7, 80, 64, 5, 6, 39, 55));
//array_push(global.sprites.male.hand_items.axe_wood.die, create_sprite(ss_axe_wood, 10, 7, 80, 64, 6, 10, 39, 55));

//array_push(global.sprites.male.hand_items.pickaxe_wood.idle, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 0, 5, 39, 55));
//array_push(global.sprites.male.hand_items.pickaxe_wood.walk, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 1, 8, 39, 55));
//array_push(global.sprites.male.hand_items.pickaxe_wood.run, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 2, 8, 39, 55));
//array_push(global.sprites.male.hand_items.pickaxe_wood.jump, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 3, 8, 39, 55));
//array_push(global.sprites.male.hand_items.pickaxe_wood.fall, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 4, 4, 39, 55));
//array_push(global.sprites.male.hand_items.pickaxe_wood.use, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 5, 6, 39, 55));
//array_push(global.sprites.male.hand_items.pickaxe_wood.die, create_sprite(ss_pickaxe_wood, 10, 7, 80, 64, 6, 10, 39, 55));


#endregion

global.actor_states = {
	idle : {
		sprites : {},
	},
	walk : {
		sprites : {},
	},
	run : {
		sprites : {},
	},
	jump : {
		sprites : {},
	},
	fall : {
		sprites : {},
	},	
	use : {
		sprites : {},
	},
	die : {
		sprites : {},
	},
}
