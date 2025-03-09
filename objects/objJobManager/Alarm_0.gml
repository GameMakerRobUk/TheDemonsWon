/// @description Update Jobs/Workers
alarm[0] = room_speed;

with objBoulder{
	if (job != undefined){
		continue;
	}
	array_push(global.jobs_no_worker.HARVEST, new HarvestResource(,id));	
}

with objTree{
	if (job != undefined){
		continue;
	}
	if (growth_stage == TREE_STAGES.adult){
		//var _harvest_jobs = struct_get(global.jobs_no_worker, "CHOP_TREE");
		array_push(global.jobs_no_worker.HARVEST, new HarvestResource(,id));
	}
}

for (var i =0; i < array_length(global.persistent_jobs); i ++){
	show_debug_message("Updating for persistent job from objJobManager")
	global.persistent_jobs[i].update();	
}

with objActor{
	if (state != ACTOR_STATE.idle){
		//show_debug_message("Actor state is " + state_debug[state] + ". Continuing")
		continue;
	}
	if (job != undefined){
		//show_debug_message("Job is defined, continuing. Job: " + string(job))
		continue;	
	}
	if (array_contains(global.idle_workers, id)){
		//show_debug_message("Already in the idle_workers array, continuing")
		continue	
	}
	//if (job == undefined && array_get_index(global.idle_workers, id) == -1){
	//add_message("Adding " + string(id) + " to available workers")
	array_push(global.idle_workers, id);	
	//show_debug_message("global.available_workers: " + string(global.idle_workers))
	//}
}

if (array_length(global.idle_workers) == 0){
	exit;	
}

for (var i = array_length(global.idle_workers) - 1; i >= 0; i --){
	var _worker = global.idle_workers[i];
	
	for (var j = 0; j < array_length(_worker.allowed_jobs); j ++){
		var _job_type = _worker.allowed_jobs[j];
		
		var _available_jobs = struct_get(global.jobs_no_worker, _job_type);
		//show_debug_message("_available_jobs: " + string(_available_jobs));
		
		if (array_length(_available_jobs) == 0){
			//show_debug_message("no available jobs for " + _job_type)
			continue;	
		}
		
		for (var k = 0; k < array_length(_available_jobs); k ++){
			with _available_jobs[k]{
				get_distance(_worker);	
			}
		}
		
		array_sort(_available_jobs, sort_by_distance);
		
		var _job = array_shift(_available_jobs);
		array_delete(global.idle_workers, i, 1);
		set_job(_worker, _job);
		break;
	}
}