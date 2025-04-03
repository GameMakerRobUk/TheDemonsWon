if (growth_stage < max_growth_stage){
	growth_stage ++;
	alarm[0] = growth_speed;	
}else{
	if (job != undefined){
		exit;
	}
	//array_push(global.jobs_no_worker.HARVEST, new HarvestResource(,id));
	add_job(global.jobs_no_worker.HARVEST, new HarvestResource(,id));
}

