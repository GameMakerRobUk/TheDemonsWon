if (state == "walk"){
	if (x == target.x && y == target.y){
		update_cell_coords();
		if (array_length(path) == 0){
			show_debug_message("Actor is done moving, ");
			
			if (job == undefined){
				show_debug_message("job is undefined.")
				state = "thinking";	
				//alarm[1] = (room_speed * 1);
			}else{
				show_debug_message("job is defined")
				job.arrived();	
			}
		}else{
			target = array_pop(path);
		}
	}else{
		var _xsign = sign(target.x - x);
		x += _xsign;
		y += sign(target.y - y);
		
		image_xscale = -_xsign;
	}
}

if (state == "use"){
	if (job == undefined)
		exit;
	
	job.step();
}