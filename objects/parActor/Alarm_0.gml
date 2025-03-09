//alarm[0] = irandom_range(room_speed, (room_speed * 3));

if (job != undefined){
	show_debug_message("parActor alarm[0], job is defined")
	//cancel	
	job.cancel_job();
	//job_finished(id);
}