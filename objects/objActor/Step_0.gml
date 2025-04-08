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
	}
}

if (state == "use"){
	if (job == undefined)
		exit;
	
	job.step();
}