if (!has_initialised){
	job = new Farm(id, inventory);
	array_push(global.persistent_jobs, job);
	has_initialised = true;
}