function growth_alarm_func(){
	
	timer = 0;
	
	with owner{
		if (growth_stage < max_growth_stage){
			growth_stage ++;
			//alarm_time = growth_speed;	
		}else{
			if (job != undefined){
				exit;
			}
			job = new HarvestResource(,id);
			add_job(global.jobs_no_worker.HARVEST, job);
			other.loop = false;
		}
	}
}