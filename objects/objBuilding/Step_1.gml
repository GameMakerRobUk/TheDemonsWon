if (!has_initialised){
	job = new DeliverResources(id, inventory, 5);
	array_push(global.persistent_jobs, job);
	has_initialised = true;
}