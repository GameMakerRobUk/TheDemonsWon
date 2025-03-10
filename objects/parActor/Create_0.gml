enum ACTOR_STATE{
	idle,
	moving,
	working,
	thinking,
}

weight = new Weight(10, 0);

state_debug = ["idle", "moving", "working", "thinking"]

inventory = {};
allowed_jobs = [];

item_was_taken = function(){
	show_debug_message("parActor item_was_taken")
	//was it stolen? lol	
}

item_was_given = function(){
	show_debug_message("parActor item_was_given")
	//Update weight etc	
}

job_was_cancelled = function(){
	show_debug_message("parActor job_was_cancelled")
	job_finished(id);
}

if (TEST_CANCELLATIONS){
	alarm[0] = irandom_range(room_speed, (room_speed * 3));//Test Cancelling jobs
}

race = irandom(4);
sex = choose("male", "female");

sprites = struct_get(global.sprites, sex);