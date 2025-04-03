global.idle_workers = [];
global.jobs_no_worker = {
	"HARVEST" : [],//ds_priority_create(),
	"HAUL_ITEM" : [],//ds_priority_create(),
	"GET_ITEM" : [],//ds_priority_create(),
	"BUILD" : [],//ds_priority_create(),
}
global.jobs_active = {
	"HARVEST" : [],
	"HAUL_ITEM" : [],
	"GET_ITEM" : [],
	"BUILD" : [],
}
alarm[0] = room_speed;

global.persistent_jobs = [];
