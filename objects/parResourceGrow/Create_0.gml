event_inherited();

growth_speed = (room_speed * 2);
max_growth_stage = image_number - 1;
growth_stage = 0;
hp = 5;
myDeathResource = undefined;

alarm[0] = growth_speed;

i_was_damaged = function(){
	if (hp > 0){
		exit;	
	}
	die();	
}

die = function(){
	if (myDeathResource != undefined){
		instance_create_layer(x, y, "Resource", myDeathResource);	
	}
	
	instance_destroy();	
	
	with job{
		show_debug_message("resource died")
		state = "JOB_FINISHED";
		job_finished(worker);	
	}
}

tool_name = undefined;