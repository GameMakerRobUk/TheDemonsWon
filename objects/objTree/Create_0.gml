event_inherited();

enum TREE_STAGES {
	sapling,
	youth,
	teenager,
	adult,
}

growth_stage = TREE_STAGES.adult;
hp = 5;

alarm[0] = (room_speed * 5);

i_was_damaged = function(){
	if (hp > 0){
		exit;	
	}
	die();	
}

die = function(){
	instance_create_layer(x, y, "Resource", objLog);
	instance_destroy();	
	
	with job{
		show_debug_message("resource died")
		state = "JOB_FINISHED";
		job_finished(worker);	
	}
}

required_item = "axe";