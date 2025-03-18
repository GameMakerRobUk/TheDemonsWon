event_inherited();

max_growth_stage = image_number - 1;
growth_stage = 0;
hp = 5;

alarm[0] = (room_speed * 5);

i_was_damaged = function(){
	if (hp > 0){
		exit;	
	}
	die();	
}

die = function(){
	instance_create_layer(x, y, "Resource", objSeed);
	instance_destroy();	
	
	with job{
		show_debug_message("resource died")
		state = "JOB_FINISHED";
		job_finished(worker);	
	}
}

tool_name = "";