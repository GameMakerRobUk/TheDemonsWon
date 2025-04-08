if (!has_initialised){
	job = new DeliverResources(id, inventory, 2);
	array_push(global.persistent_jobs, job);
	has_initialised = true;
}