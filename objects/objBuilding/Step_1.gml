if (!has_initialised){
	job = new DeliverResources(id, inventory);
	array_push(global.persistent_jobs, job);
	has_initialised = true;
}