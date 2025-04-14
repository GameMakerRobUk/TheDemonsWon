#region States
	
function Idle(_owner) constructor{
	owner = _owner;

	static init = function(){
		owner.alarms[0] = new Alarm(room_speed * 2, owner.decide_job, owner, true);
		owner.sprite_state = "idle";
	}
	
	static step = function(){
		with owner{
			if (x != target.x || y != target.y){
				change_state("walk");
			}
		}
	}
}

function Walk(_owner, _on_walk_done = undefined) constructor{
		
	static init = function(){
		on_walk_done = _on_walk_done == undefined? default_walk_done : _on_walk_done;
		owner.sprite_state = "walk";
	}
	
	static default_walk_done = function(){
		
		update_cell_coords();
		
		with owner{
			if (array_length(path) == 0){
				show_debug_message("Actor is done moving, ");
			
				if (job == undefined){
					show_debug_message("job is undefined.")
					change_state("idle");	
					//alarm[1] = (room_speed * 1);
				}else{
					show_debug_message("job is defined")
					job.arrived();	
				}
			}else{
				target = array_pop(path);
			}
		}
		
		//with owner{
		//	state = change_state("idle");
		//}
	}
	
	static step = function(){
		if (owner.x == owner.target.x && owner.y == owner.target.y){
			on_walk_done();	
		}else{
			//if (x == target.x && y == target.y){
				//update_cell_coords();
				//if (array_length(path) == 0){
				//	show_debug_message("Actor is done moving, ");
			
				//	if (job == undefined){
				//		show_debug_message("job is undefined.")
				//		state = "thinking";	
				//		//alarm[1] = (room_speed * 1);
				//	}else{
				//		show_debug_message("job is defined")
				//		job.arrived();	
				//	}
				//}else{
				//	target = array_pop(path);
				//}
			//}else{
			with owner{
				var _xdiff = target.x - x;
				var _xsign = sign(_xdiff);
				var _ydiff = target.y - y;
				var _ysign = sign(_ydiff)
		
				var _xval = _xsign * global.delta.multiplier;
				var _yval = _ysign * global.delta.multiplier;
		
				if (abs(_xval) > abs(_xdiff)) x = target.x;
				else x += _xval;
		
				if (abs(_yval) > abs(_ydiff)) y = target.y;
				else y += _yval;
		
				image_xscale = -_xsign;
				
				inst.x = x;
				inst.y = y;
				inst.image_xscale = image_xscale;
			//}
			}
		}
	}
}
	
#endregion

function Stat(_base, _max) constructor{
	base = _base;
	current = _base;
	base_max = _max;
}

function Character(_x, _y, _allowed_jobs) constructor{
	x = _x;
	y = _y;
	
	job = undefined;
	path = [];
	
	allowed_jobs = _allowed_jobs;
	weight = new Weight(10, 0);
	inventory = {};
	
	hp = new Stat(100, 100);
	nutrition = new Stat(100, 100);
	
	race = irandom(4);
	sex = choose("male", "female");
	hand_item = {name : undefined, sprite : -1};
	name = "NO NAME";

	sprites = new ActorSprites(sex, race);
	
	inst = instance_create_layer(x, y, "Actors", parActor, {sprites : sprites, state : "idle", hand_item : {name : undefined, sprite : -1}});
	change_state("idle");
	
	static step = function(){
		state.step();
		get_sprite();	
	}
	
	/// @function        change_state(_state_string);
	/// @param {struct}  _state_string  what state to change to
	static change_state = function(_state_string){
		switch _state_string{
			case "idle" : state =  new Idle(self); break;	
			case "walk" : state =  new Walk(self); break;	
		}
		
		show_debug_message("state: " + string(state));
		
		state.init();
	}
	
	static decide_job = function(){
	
	}
	
	static get_sprite = function(){
		var _state_sprites = struct_get(sprites, sprite_state);

		if (sprite_index != _state_sprites.body){
			sprite_index = _state_sprites.body;
			image_speed = _state_sprites.image_speed;
			
			with inst{
				sprite_index = other.sprite_index;	
				image_speed = other.image_speed;	
			}
		}

		if (hand_item.name != undefined && hand_item.sprite != struct_get(_state_sprites.hand_items, hand_item.name)){
			hand_item.sprite = struct_get(_state_sprites.hand_items, hand_item.name);
		}

		image_speed = (global.delta.multiplier * _state_sprites.image_speed);
		
		with inst{
			image_speed = other.image_speed;
			hand_item = other.hand_item;
		}
		
	}
	
	static item_was_taken = function(){
		show_debug_message("Character item_was_taken")
		//was it stolen? lol	
	}

	static item_was_given = function(){
		show_debug_message("Character item_was_given")
		//Update weight etc	
	}

	static job_was_cancelled = function(){
		show_debug_message("Character job_was_cancelled")
		job_finished();
	}
	
	/// @function        set_job(_job);
	/// @param {struct}  _job  what job is to be performed
	static set_job = function(_job){
		job = _job;	
		_job.worker = self;
		_job.initialise();
	}

	static job_finished = function(){
		show_debug_message("job_finished | worker inv: " + string(inventory))
		job = undefined;
		//state = new Idle(self);
		change_state("idle");
		path = [];
	}

	static actor_cancel_job = function (){
		if (job != undefined){
			show_debug_message("actor_cancel_job, job is defined")
			//cancel	
			job.cancel_job();
		}
	}

	static actor_go_idle = function(){
		//state = new Idle(self);
		change_state("idle");
	}

	/// @function        move_to_pos(_target_cell_x, _target_cell_y);
	/// @param {integer}  _target_cell_x  cell_x to move to
	/// @param {integer}  _target_cell_y  cell_y to move to
	static move_to_pos = function(_target_cell_x, _target_cell_y){
		show_debug_message("move_to_pos");
		set_path(_target_cell_x, _target_cell_y);
		//state = new Walk(self);
		change_state("walk");
	}

	/// @function        set_path(_target_cell_x, _target_cell_y);
	/// @param {integer}  _target_cell_x  cell_x to move to
	/// @param {integer}  _target_cell_y  cell_y to move to
	static set_path = function(_target_cell_x, _target_cell_y){
		var _start_node = global.nodes[cell_x][cell_y];
		var _end_node = global.nodes[_target_cell_x][_target_cell_y];
		
		show_debug_message("_start_node: " + string(_start_node))
		show_debug_message("_end_node: " + string(_end_node))
		
		set_node_parents({cell_x : cell_x, cell_y : cell_y});	
		path = get_path(_start_node, _end_node);
	}

	/// @function        get_path(_start_node, _end_node);
	/// @param {integer}  _start_node  objNode moving from
	/// @param {integer}  _end_node    objNode moving to
	static get_path = function(_start_node, _end_node){
		show_debug_message("get_path");
		show_debug_message("start_node: " + string(_start_node) + " | _end_node: " + string(_end_node))
		var _path = [];
		var _current = _end_node;
	
		while _current != _start_node{
			
			if (_current == noone){
				show_debug_message("Error, node is noone, exiting | path: " + string(_path));
				return _path;
			}
			array_push(_path, _current);
			_current = _current.parent;
		}
	
		return _path;
	}
}