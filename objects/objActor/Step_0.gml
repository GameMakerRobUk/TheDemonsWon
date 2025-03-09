if (state == ACTOR_STATE.moving){
	if (x == target.x && y == target.y){
		update_cell_coords();
		if (array_length(path) == 0){
			show_debug_message("Actor is done moving, ");
			
			if (job == undefined){
				show_debug_message("job is undefined.")
				state = ACTOR_STATE.thinking;	
				//alarm[1] = (room_speed * 1);
			}else{
				show_debug_message("job is defined")
				job.arrived();	
			}
		}else{
			target = array_pop(path);
		}
	}else{
		x += sign(target.x - x);
		y += sign(target.y - y);
	}
}

if (state == ACTOR_STATE.working){
	if (job == undefined)
		exit;
	
	job.step();
}