function set_job(_worker, _job){
	_worker.job = _job;	
	_job.worker = _worker;
	add_message("Job [" + _job.type + "] set for " + string(_worker) );
	_job.initialise();
}

function job_finished(_worker){
	with _worker{
		show_debug_message("job_finished | worker inv: " + string(_worker.inventory))
		job = undefined;
		state = ACTOR_STATE.idle//ACTOR_STATE.thinking;
		//alarm[1] = room_speed * 1;
		path = [];
	}
}

function move_to_pos(_cell_x, _cell_y, _actor){
	show_debug_message("move_to_pos");
	set_path(_cell_x, _cell_y, _actor);
	_actor.state = ACTOR_STATE.moving;
}

function set_path(_cell_x, _cell_y, _actor){
	
	show_debug_message("_actor cell_x/y: " + string(_actor.cell_x) + "/" + string(_actor.cell_y));
	show_debug_message("_cell_x/y: " + string(_cell_x) + "/" + string(_cell_y));
	
	
	show_debug_message("set_path | cell_x: " + string(_cell_x) + " | cell_y: " + string(_cell_y));
	var _start_node = global.nodes[_actor.cell_x][_actor.cell_y];
	var _end_node = global.nodes[_cell_x][_cell_y];
		
	show_debug_message("_start_node: " + string(_start_node))
	show_debug_message("_end_node: " + string(_end_node))
		
	set_node_parents({cell_x : _actor.cell_x, cell_y : _actor.cell_y});	
	_actor.path = get_path(_start_node, _end_node);
	
	add_message("Path set for " + string(_actor) + " to " + string(_cell_x) + "," + string(_cell_y));
}

function get_path(_start_node, _end_node){
	show_debug_message("get_path");
	show_debug_message("start_node: " + string(_start_node) + " | _end_node: " + string(_end_node))
	var _path = [];
	var _current = _end_node;
	
	while _current != _start_node{
		//show_debug_message("_current: " + string(_current))
			
		if (_current == noone){
			show_debug_message("Error, node is noone, exiting | path: " + string(_path));
			return _path;
		}
		array_push(_path, _current);
		_current = _current.parent;
	}
	
	return _path;
}